import SwiftUI

struct MotionAnimationView: View {

  // MARK: - Parameters
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var isAnimating: Bool = false
  // MARK: - Function
  func randomCoordinate(max: CGFloat) -> CGFloat {
    CGFloat.random(in: 0...max)
  }

  func randomSize() -> CGFloat {
    CGFloat.random(in: 10...300)
  }

  func randomScale() -> CGFloat {
    CGFloat(Double.random(in: 1.0...2.0))
  }

  func randomSpeed() -> Double {
    Double.random(in: 0.025...1.0)
  }

  func randomDelay() -> Double {
    Double.random(in: 0...2)
  }

  // MARK: Body

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0..<randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(x: randomCoordinate(max: geometry.size.width),
                    y: randomCoordinate(max: geometry.size.height)
            )
            .animation(
              Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            )
            .onAppear(perform: {
              isAnimating = true
            })
        }
      }//: ZStack
      .drawingGroup()
    }//: Geometry
  }
}

// MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
      .previewDevice("iPhone 12 Pro")
  }
}
