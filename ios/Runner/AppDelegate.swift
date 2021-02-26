

import UIKit
import Flutter
import GoogleMaps

    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {




        GeneratedPluginRegistrant.register(with: self)
        GMSServices.provideAPIKey("AIzaSyCKKPsJXYbDt4noigWs-KiYVK4-Bia7B34")
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    }

