# Building PongoOS iOS Emulator

## Prerequisites

- **macOS 12.0+** with latest Xcode installed
- **iOS 14.0+** target deployment
- An Apple Developer Account (free tier works)

## Steps to Build

### 1. Clone the Repository

```bash
git clone https://github.com/ipod-master/PongoOS-iOS-Emulator.git
cd PongoOS-iOS-Emulator
```

### 2. Open in Xcode

```bash
open PongoOS-iOS-Emulator.xcodeproj
```

### 3. Select Target Device

- For Simulator: Select "iPhone 14 Pro" (or any available iPhone simulator)
- For Real Device: Connect your iOS device and select it from the device list

### 4. Configure Signing (for real device)

1. Open the project settings (left sidebar)
2. Select "PongoOS-iOS-Emulator" target
3. Go to "Signing & Capabilities" tab
4. Select your Development Team
5. Modify Bundle Identifier if needed (e.g., add your prefix)

### 5. Build and Run

**Method 1: Using Xcode GUI**
- Press `Cmd + R` to build and run
- Or go to Product → Run

**Method 2: Using Command Line**

```bash
# Build for simulator
xcodebuild -scheme PongoOS-iOS-Emulator -configuration Debug -arch arm64 -sdk iphonesimulator

# Build for real device
xcodebuild -scheme PongoOS-iOS-Emulator -configuration Debug -arch arm64 -sdk iphoneos
```

### 6. Run the App

1. The app will install automatically on the selected device/simulator
2. Look for the "PongoOS Emulator" app icon
3. Tap to launch
4. Press "Start Boot" to begin the boot sequence simulation

## Troubleshooting

### Build Fails with Code Signing Error

```bash
# Solution: Reset signing settings
xcodebuild -allowProvisioningUpdates -scheme PongoOS-iOS-Emulator
```

### Xcode Can't Find Swift Files

1. Clean build folder: `Cmd + Shift + K`
2. Delete derived data:
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData/*
   ```
3. Rebuild: `Cmd + B`

### App Crashes on Launch

1. Check Xcode console for error messages
2. Ensure iOS deployment target is 14.0 or higher
3. Try running on simulator first

### Device Not Showing in Xcode

1. Disconnect and reconnect the device
2. Trust the device when prompted on the device itself
3. Restart Xcode
4. Check: Window → Devices and Simulators

## Building for Distribution

### Create an Archive

1. Product → Archive
2. Wait for build to complete
3. Organizer window opens automatically
4. Select your archive and click "Validate App"
5. Click "Distribute App"

### Export IPA

1. After validation, click "Export"
2. Select "Ad Hoc" or "Development"
3. Choose your signing certificate
4. Select your provisioning profile
5. Click "Export" and save the .ipa file

## Command Line Build Example

```bash
# Full build and archive for real device
xcodebuild archive \
  -scheme PongoOS-iOS-Emulator \
  -archivePath ./build/PongoOS.xcarchive \
  -configuration Release \
  -sdk iphoneos \
  -allowProvisioningUpdates

# Export from archive
xcodebuild -exportArchive \
  -archivePath ./build/PongoOS.xcarchive \
  -exportOptionsPlist ExportOptions.plist \
  -exportPath ./build/
```

## System Requirements for Building

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| macOS | 11.0 | 12.6+ |
| Xcode | 13.0 | 14.2+ |
| iOS Target | 14.0 | 14.4+ |
| RAM | 4GB | 8GB+ |
| Disk Space | 10GB free | 30GB free |

## Development Notes

- The app uses SwiftUI (iOS 14+ native)
- No external dependencies required
- Supports both iPhone and iPad
- Portrait and landscape orientations supported
- Works on both real devices and simulators

## Performance

- First launch may take 30-60 seconds (initial compilation)
- Subsequent launches are instant
- Simulator performance: ~60 FPS
- Real device performance: ~120 FPS (iPhone 12+)

For more information, visit the [PongoOS GitHub](https://github.com/checkra1n/PongoOS) and [Xcode Documentation](https://developer.apple.com/xcode/)
