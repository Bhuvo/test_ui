import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

  var privacyView: UIView?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Listen for screenshot notification
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(userDidTakeScreenshot),
      name: UIApplication.userDidTakeScreenshotNotification,
      object: nil
    )

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationWillResignActive(_ application: UIApplication) {
    // Add blur to hide app content in app switcher
    let blurEffect = UIBlurEffect(style: .light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = window?.bounds ?? .zero
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    window?.addSubview(blurEffectView)
    privacyView = blurEffectView
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    // Remove blur when app becomes active again
    privacyView?.removeFromSuperview()
  }

  @objc func userDidTakeScreenshot() {
    print("📸 Screenshot detected!")
    // You can call a Flutter method channel here if needed
  }
}
