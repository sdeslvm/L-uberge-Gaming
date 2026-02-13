import SwiftUI

@main
struct PowerMotionPlayApp: App {
  @UIApplicationDelegateAdaptor(PowerMotionPlayAppDelegate.self) private var appDelegate

  var body: some Scene {
    WindowGroup {
      PowerMotionPlayGameInitialView()
    }
  }
}
