import UIKit
import Flutter
import Foundation
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//   GMSServices.provideAPIKey( ProcessInfo.processInfo.environment["mapsKey"]!)
 if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
  }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
//   func getEnvironmentVar(_ name: String) -> String? {
//       guard let rawValue = getenv(name) else { return nil }
//       return String(utf8String: rawValue)
//   }
}
