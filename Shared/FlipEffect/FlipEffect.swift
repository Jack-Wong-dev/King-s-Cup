import SwiftUI

struct FlipEffect: GeometryEffect {
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }
    
    @Binding var flipped: Bool
    var angle: Double
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        DispatchQueue.main.async {
            flipped = angle >= 90 && angle < 270
        }
        
        let newAngle = flipped ? -180 + angle : angle
        let angleInRadians = CGFloat(Angle(degrees: newAngle).radians)
        
        var transform3d = CATransform3DIdentity
        
        transform3d.m34 = -1 / max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, angleInRadians, 0, 1, 0)
        
        transform3d = CATransform3DTranslate(transform3d, -size.width / 2, -size.height / 2, 0)
        
        let affineTransform = ProjectionTransform(
            CGAffineTransform(
                translationX: size.width / 2,
                y: size.height / 2)
        )
        
        return ProjectionTransform(transform3d)
            .concatenating(affineTransform)
    }
    
    
    
}


struct FlipDemo: View {
    @State var flipped = false
    @State var flip = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.red)
                .frame(width: 200, height: 150)
                .overlay(
                    Text("Red Card")
                )
                .opacity(flipped ? 0 : 1)
            
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.green)
                .frame(width: 200, height: 150)
                .overlay(
                    Text("Green Card")
                )
                .opacity(flipped ? 1 : 0)
        }
        .modifier(FlipEffect(flipped: $flipped, angle: flip ? 180 : 0))
        .onTapGesture {
            withAnimation(Animation.easeOut(duration: 1)) {
                flip.toggle()
            }
        }
    }
}

struct FlipDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlipDemo()

            FlipDemo()
                .preferredColorScheme(.dark)
        }
        .buttonStyle(SelectionButtonStyle())
    }
}
