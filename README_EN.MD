# IronSourceOperaSDKAdapter

Custom adapter for integrating Opera Ads SDK with IronSource (Unity LevelPlay) mediation platform.

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/IronSourceOperaSDKAdapter.svg)](https://cocoapods.org/pods/IronSourceOperaSDKAdapter)
[![Platform](https://img.shields.io/cocoapods/p/IronSourceOperaSDKAdapter.svg?style=flat)](https://cocoapods.org/pods/IronSourceOperaSDKAdapter)
[![License](https://img.shields.io/cocoapods/l/IronSourceOperaSDKAdapter.svg?style=flat)](https://github.com/operaads/IronSourceOperaSDKAdapter/blob/main/LICENSE)

English | [简体中文](README.MD)

## Overview

IronSourceOperaSDKAdapter is a custom mediation adapter that enables seamless integration of Opera Advertising SDK (OpAdxSdk) with the IronSource (Unity LevelPlay) mediation platform. This adapter bridges Opera Ads SDK callbacks to LevelPlay mediation callbacks, enabling ad serving through the LevelPlay platform.

## Supported Ad Formats

- Banner Ads (Standard 320x50, MREC 300x250)
- Interstitial Ads
- Rewarded Ads

## Requirements

- iOS 13.0+
- IronSource SDK 9.3.0.0+
- OpAdxSdk 2.12.0
- Xcode 16.0+

## Installation

### CocoaPods

Add the following to your `Podfile`:

```ruby
# IronSource LevelPlay SDK
pod 'IronSourceSDK', '>= 9.3.0.0'

# Opera Ads SDK
pod 'OpAdxSdk', '2.12.0'

# Opera Ads LevelPlay Adapter
pod 'IronSourceOperaSDKAdapter', '2.12.0.0'
```

Then run:

```bash
pod install
```

## Quick Start

### 1. Initialize LevelPlay SDK

```swift
import IronSource

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let requestBuilder = LPMInitRequestBuilder(appKey: "YOUR_APP_KEY")
        let initRequest = requestBuilder.build()
        LevelPlay.initWith(initRequest) { config, error in
            if let error = error {
                print("LevelPlay initialization failed: \(error)")
            } else {
                print("LevelPlay SDK initialized")
            }
        }

        // Opera Ads SDK will be auto-initialized by the adapter

        return true
    }
}
```

### 2. Configure Custom Ad Network

In the Unity LevelPlay dashboard:

1. Sign in to the [Unity LevelPlay Dashboard](https://app.unity.com/monetization/levelplay)
2. Navigate to **LevelPlay** → **Setup** → **SDK Networks**
3. Click **Manage Networks** → **Custom Adapter**
4. Fill in the following information:
   - **Network Key**: `operaads`
   - **iOS Adapter Class Name**: `ISOperaAdsCustomAdapter`

### 3. Configure Ad Units

On the **Ad Units** page, add Opera Ads as an ad source:

1. Select an ad unit → **Setup** → **Instances** → **Add Instance**
2. Select **Opera Ads** custom network
3. Configure the instance parameters:

**Parameter Mapping**:

| LevelPlay Field | Key | Description |
|-----------------|-----|-------------|
| **App ID** | `appid` | Your Opera Ads Application ID (format: `pub{}/ep{}/app{}`) |
| **Placement ID** | `placementid` | Your Opera Ads Placement ID (format: `s{}`) |
| **Bundle ID** | `operaBundleId` | Your iOS App Store ID |

## Version History

### 2.12.0.0 (2026-07-31)
- Upgraded OpAdxSdk dependency to 2.12.0

### 2.11.2.0 (2026-07-02)
- Initial release
- Support for Banner, Interstitial, and Rewarded ad formats
- Depends on OpAdxSdk 2.11.2

## Important Notes

### 1. Initialization Order
Opera Ads SDK is automatically initialized through the adapter. No manual initialization is required.

### 2. Adapter Class Name
LevelPlay uses a unified adapter class name `ISOperaAdsCustomAdapter` shared across all ad formats.

### 3. Error Handling
All errors are returned through LevelPlay's standard error callbacks with detailed error information.

### Common Issues

**Q: Ads not loading?**
A: Check the following:
1. Verify custom network configuration in LevelPlay dashboard is correct
2. Ensure Network Key is `operaads`
3. Ensure iOS Adapter Class Name is `ISOperaAdsCustomAdapter`
4. Verify instance parameters (appid, placementid, operaBundleId) are correct
5. Check console logs for detailed error messages

**Q: Adapter class not found?**
A: Make sure:
1. `IronSourceOperaSDKAdapter` Pod is correctly installed
2. Clean and rebuild your project

## Sample Project

For a complete sample project, see:
- [OpAdxSDK Demo - Unity Adapter](https://github.com/operaads/iOS-sdk/tree/main/Demo/UnityAdapter)

## Technical Support

- Email: chenl@opera.com
- Documentation: [Opera Ads iOS SDK Documentation]
- Issue Tracker: [GitHub Issues](https://github.com/operaads/IronSourceOperaSDKAdapter/issues)

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) file for details.

## Related Links

- [Opera Ads SDK](https://github.com/operaads/iOS-sdk)
- [Unity LevelPlay Documentation](https://developers.is.com/ironsource-mobile/ios/mediation-getting-started-ios/)
- [CocoaPods](https://cocoapods.org/pods/IronSourceOperaSDKAdapter)
