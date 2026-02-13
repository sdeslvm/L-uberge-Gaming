import SwiftUI

struct PowerMotionPlayLoadingScreen: View {
  let progress: Double

  private var clampedProgress: Double { min(max(progress, 0), 1) }
  private var progressText: String { "\(Int((clampedProgress * 100).rounded()))%" }

  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()

      VStack(spacing: 28) {
        VStack(spacing: 12) {
          Text("Power. Motion. Play.")
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(hex: "#D90429"))

          Text("Loading \(progressText)")
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .foregroundColor(Color.black.opacity(0.65))
        }

        ProgressView(value: clampedProgress)
          .progressViewStyle(.linear)
          .tint(Color(hex: "#D90429"))
          .frame(maxWidth: 260)

        ProgressView()
          .progressViewStyle(.circular)
          .tint(Color(hex: "#D90429"))
      }
      .padding(32)
    }
  }
}

@available(iOS 17.0, *)
#Preview {
  PowerMotionPlayLoadingScreen(progress: 0.45)
}
