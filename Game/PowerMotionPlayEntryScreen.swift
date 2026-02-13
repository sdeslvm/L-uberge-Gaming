import Foundation
import SwiftUI

struct PowerMotionPlayEntryScreen: View {
  @StateObject private var loader: PowerMotionPlayWebLoader

  init(loader: PowerMotionPlayWebLoader) {
    _loader = StateObject(wrappedValue: loader)
  }

  var body: some View {
    ZStack {
      PowerMotionPlayWebViewBox(loader: loader)
        .opacity(loader.state == .finished ? 1 : 0.5)
      switch loader.state {
      case .progressing(let percent):
        PowerMotionPlayProgressIndicator(value: percent)
      case .failure(let err):
        PowerMotionPlayErrorIndicator(err: err)  // err теперь String
      case .noConnection:
        PowerMotionPlayOfflineIndicator()
      default:
        EmptyView()
      }
    }
  }
}

private struct PowerMotionPlayProgressIndicator: View {
  let value: Double
  var body: some View {
    GeometryReader { geo in
      PowerMotionPlayLoadingScreen(progress: value)
        .frame(width: geo.size.width, height: geo.size.height)
        .background(Color.white)
    }
  }
}

private struct PowerMotionPlayErrorIndicator: View {
  let err: String  // было Error, стало String
  var body: some View {
    Text("Ошибка: \(err)").foregroundColor(.red)
  }
}

private struct PowerMotionPlayOfflineIndicator: View {
  var body: some View {
    Text("Нет соединения").foregroundColor(.gray)
  }
}
