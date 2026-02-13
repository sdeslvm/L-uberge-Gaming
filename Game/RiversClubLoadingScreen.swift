import SwiftUI

struct RiversClubLoadingScreen: View {
  let progress: Double

  private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
  private let placeholders = RiversClubImagePlaceholder.all

  private var progressPercentage: Int {
    Int((min(max(progress, 0), 1) * 100).rounded())
  }

  var body: some View {
    GeometryReader { geometry in
      let contentWidth = min(geometry.size.width, 420)

      Color.white
        .ignoresSafeArea()
        .overlay(
          VStack(spacing: 32) {
            RiversClubBrandingHeader()

            LazyVGrid(columns: columns, spacing: 20) {
              ForEach(placeholders) { placeholder in
                RiversClubImageCard(gradient: placeholder.gradient)
              }
            }
            .frame(maxWidth: .infinity)

            RiversClubProgressSection(progress: progress, percentage: progressPercentage)
          }
          .frame(maxWidth: contentWidth)
          .padding(.horizontal, max((geometry.size.width - contentWidth) / 2, 24))
          .padding(.vertical, 48)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        )
    }
  }
}

private struct RiversClubBrandingHeader: View {
  var body: some View {
    VStack(spacing: 20) {
      Text("Power.\nMotion.\nPlay.")
        .multilineTextAlignment(.center)
        .font(.system(size: 44, weight: .heavy, design: .serif))
        .foregroundColor(Color(hex: "#D90429"))

      Text("Select Image")
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .foregroundColor(Color.black.opacity(0.85))
        .textCase(.uppercase)
        .tracking(1.1)
    }
  }
}

private struct RiversClubImageCard: View {
  let gradient: LinearGradient

  var body: some View {
    RoundedRectangle(cornerRadius: 20, style: .continuous)
      .fill(Color.white)
      .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
      .overlay(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(gradient)
          .padding(10)
          .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
              .stroke(Color.white, lineWidth: 6)
          )
      )
      .aspectRatio(1, contentMode: .fit)
  }
}

private struct RiversClubProgressSection: View {
  let progress: Double
  let percentage: Int

  var body: some View {
    VStack(spacing: 12) {
      ProgressView(value: min(max(progress, 0), 1))
        .progressViewStyle(.linear)
        .tint(Color(hex: "#D90429"))

      Text("Loading \(percentage)%")
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(Color.black.opacity(0.65))
    }
  }
}

private struct RiversClubImagePlaceholder: Identifiable {
  let id = UUID()
  let gradient: LinearGradient

  init(colors: [Color]) {
    gradient = LinearGradient(
      gradient: Gradient(colors: colors),
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  }

  static let all: [RiversClubImagePlaceholder] = [
    RiversClubImagePlaceholder(colors: [Color(hex: "#C084FC"), Color(hex: "#7C3AED")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#F97316"), Color(hex: "#FDBA74")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#029EEC"), Color(hex: "#38BDF8")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#FACC15"), Color(hex: "#EAB308")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#F472B6"), Color(hex: "#EC4899")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#22D3EE"), Color(hex: "#0EA5E9")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#FB7185"), Color(hex: "#F43F5E")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#34D399"), Color(hex: "#10B981")]),
    RiversClubImagePlaceholder(colors: [Color(hex: "#F59E0B"), Color(hex: "#F97316")]),
  ]
}

@available(iOS 17.0, *)
#Preview {
  RiversClubLoadingScreen(progress: 0.65)
}
