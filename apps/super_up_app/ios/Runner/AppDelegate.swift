import UIKit
import Flutter
import Foundation
import GoogleMaps
import flutter_local_notifications
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//   GMSServices.provideAPIKey( ProcessInfo.processInfo.environment["mapsKey"]!)
print(getEnvironmentVar("mapsKey"))
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
  FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    GeneratedPluginRegistrant.register(with: registry)
  }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  func getEnvironmentVar(_ name: String) -> String? {
      guard let rawValue = getenv(name) else { return nil }
      return String(utf8String: rawValue)
  }
}
