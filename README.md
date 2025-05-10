# **Flutter Platform Channels Example: Battery Level Checker**  

🚀 **A complete example demonstrating Flutter Platform Channels to fetch battery level from Android/iOS natively.**  

---

## **🤔 What are Platform Channels?**  

**Platform Channels** in Flutter allow **bidirectional communication** between **Dart (Flutter)** and **native platform code (Kotlin/Swift)**.  

- **Method Channels** → Call platform-specific APIs (e.g., battery level, sensors).  
- **Event Channels** → Stream continuous data (e.g., GPS updates).  
- **BasicMessage Channels** → Simple message passing.  


This example uses **MethodChannel** to fetch the device's **battery percentage** from Android/iOS.  

![PlatformChannels](https://github.com/user-attachments/assets/bfb9e504-d35a-4d03-9a1a-61db38eb22bb)

---

## **🎯 Why Use Platform Channels?**  

✅ **Access Native APIs** – Use platform-specific features not available in Flutter (e.g., NFC, Bluetooth).  
✅ **Reuse Existing Code** – Integrate with legacy native libraries.  
✅ **Better Performance** – Offload heavy computations to native.  
✅ **Extend Flutter’s Capabilities** – Add features before Flutter officially supports them.  

---

## **✨ Features**  

✔ **Cross-Platform Battery Check** – Works on **Android & iOS**.  
✔ **Error Handling** – Gracefully handles unsupported methods.  
✔ **Clean Architecture** – Separates Flutter UI from native logic.  
✔ **Real-Device Support** – Tested on physical devices.  

---

## **🚀 Getting Started**  

### **Prerequisites**  
- Flutter SDK (≥3.0.0)  
- Android Studio / Xcode (for native code)  
- A **real device** (emulators may not return battery data)  

### **Installation**  
1. **Clone the repo**  
   ```bash
   git clone https://github.com/yourusername/flutter-platform-channels-battery.git
   cd flutter-platform-channels-battery
   ```  

2. **Run the app**  
   ```bash
   flutter pub get
   flutter run
   ```  

---

## **📂 Project Structure**  

```
📦flutter-platform-channels-battery
├── 📂android/app/src/main/kotlin/...
│   └── MainActivity.kt         # Android native implementation
├── 📂ios/Runner
│   └── AppDelegate.swift       # iOS native implementation
├── 📂lib
│   └── main.dart               # Flutter UI & channel setup
└── README.md
```  

---

## **🔧 How It Works**  

### **1️⃣ Flutter (Dart) Side**  
- Creates a `MethodChannel` with a unique ID (`samples.flutter.dev/battery`).  
- Calls `invokeMethod('getBatteryLevel')` to request battery data.  
- Handles success/error responses.  

### **2️⃣ Android (Kotlin) Side**  
- Listens for `getBatteryLevel` method call.  
- Uses `BatteryManager` to fetch battery percentage.  
- Returns result to Flutter via `result.success()`.  

### **3️⃣ iOS (Swift) Side**  
- Enables `batteryMonitoring` on `UIDevice`.  
- Converts battery level (0.0–1.0 → 0–100%).  
- Sends back the result (or error if unavailable).  

---

### **🔗 Further Reading**  
- [Flutter Official Docs: Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels)  

---
