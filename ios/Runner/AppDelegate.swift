import UIKit
import Flutter
import GoogleMobileAds

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
//     GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["3b24e14e6ae66412e9ae17b69d908c0a"]
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
