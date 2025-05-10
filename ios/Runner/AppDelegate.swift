import Flutter
import UIKit
import IOKit.ps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Initialize Flutter
    GeneratedPluginRegistrant.register(with: self)
    
    // Get the FlutterViewController
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // Set up the method channel
    let batteryChannel = FlutterMethodChannel(
      name: "samples.flutter.dev/battery",
      binaryMessenger: controller.binaryMessenger
    )
    
    // Handle method calls from Flutter
    batteryChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: FlutterResult) in
      // Check which method is being called
      if call.method == "getBatteryLevel" {
        self?.getBatteryLevel(result: result)
      } else {
        // Method not implemented
        result(FlutterMethodNotImplemented)
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func getBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    
    // Enable battery monitoring if not already enabled
    if !device.isBatteryMonitoringEnabled {
      device.isBatteryMonitoringEnabled = true
    }
    
    // Check if battery state is available
    if device.batteryState == .unknown {
      result(FlutterError(
        code: "UNAVAILABLE",
        message: "Battery information not available",
        details: nil
      ))
    } else {
      // Return battery level as percentage (0-100)
      let batteryLevel = Int(device.batteryLevel * 100)
      result(batteryLevel)
    }
  }
}