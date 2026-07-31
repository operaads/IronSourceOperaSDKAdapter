# IronSourceOperaSDKAdapter

Opera Ads SDK 的 IronSource (Unity LevelPlay) 聚合平台自定义适配器。

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/IronSourceOperaSDKAdapter.svg)](https://cocoapods.org/pods/IronSourceOperaSDKAdapter)
[![Platform](https://img.shields.io/cocoapods/p/IronSourceOperaSDKAdapter.svg?style=flat)](https://cocoapods.org/pods/IronSourceOperaSDKAdapter)
[![License](https://img.shields.io/cocoapods/l/IronSourceOperaSDKAdapter.svg?style=flat)](https://github.com/operaads/IronSourceOperaSDKAdapter/blob/main/LICENSE)

[English](README_EN.MD) | 简体中文

## 概述

IronSourceOperaSDKAdapter 是一个自定义聚合适配器，使 Opera Advertising SDK (OpAdxSdk) 能够与 IronSource (Unity LevelPlay) 聚合平台无缝集成。该适配器将 Opera Ads SDK 的回调桥接到 LevelPlay 的聚合回调，实现通过 LevelPlay 平台进行广告投放。

## 支持的广告格式

- Banner 广告（标准 320x50、MREC 300x250）
- 插屏广告（Interstitial）
- 激励广告（Rewarded）

## 版本要求

- iOS 13.0+
- IronSource SDK 9.3.0.0+
- OpAdxSdk 2.12.0
- Xcode 16.0+

## 安装

### CocoaPods

在您的 `Podfile` 中添加：

```ruby
# IronSource LevelPlay SDK
pod 'IronSourceSDK', '>= 9.3.0.0'

# Opera Ads SDK
pod 'OpAdxSdk', '2.12.0'

# Opera Ads LevelPlay 适配器
pod 'IronSourceOperaSDKAdapter', '2.12.0.0'
```

然后运行：

```bash
pod install
```

## 快速开始

### 1. 初始化 LevelPlay SDK

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

        // Opera Ads SDK 会通过适配器自动初始化

        return true
    }
}
```

### 2. 配置自定义广告网络

在 Unity LevelPlay 后台配置：

1. 登录 [Unity LevelPlay Dashboard](https://app.unity.com/monetization/levelplay)
2. 进入 **LevelPlay** → **Setup** → **SDK Networks**
3. 点击 **Manage Networks** → **Custom Adapter**
4. 填写以下信息：
   - **Network Key**: `operaads`
   - **iOS Adapter Class Name**: `ISOperaAdsCustomAdapter`

### 3. 配置广告位

在 **Ad Units** 页面，添加 Opera Ads 作为广告源：

1. 选择广告位 → **Setup** → **Instances** → **Add Instance**
2. 选择 **Opera Ads** 自定义广告网络
3. 配置实例参数：

**参数映射**：

| LevelPlay 字段 | Key | 说明 |
|---------------|-----|------|
| **App ID** | `appid` | Opera Ads 应用 ID（格式：`pub{}/ep{}/app{}`） |
| **Placement ID** | `placementid` | Opera Ads 广告位 ID（格式：`s{}`） |
| **Bundle ID** | `operaBundleId` | App 在苹果商店的数字 ID |

## 版本历史

### 2.12.0.0 (2026-07-31)
- 升级依赖 OpAdxSdk 至 2.12.0

### 2.11.2.0 (2026-07-02)
- 初始版本
- 支持 Banner、Interstitial、Rewarded 广告格式
- 依赖 OpAdxSdk 2.11.2

## 注意事项

### 1. 初始化顺序
Opera Ads SDK 会通过适配器自动初始化，无需手动初始化。

### 2. 适配器类名
LevelPlay 使用统一的适配器类名 `ISOperaAdsCustomAdapter`，所有广告格式共用。

### 3. 错误处理
所有错误都会通过 LevelPlay 的标准错误回调返回，包含详细的错误信息。

### 常见问题

**Q: 广告无法加载？**
A: 检查以下项：
1. LevelPlay 后台自定义广告网络配置是否正确
2. Network Key 是否为 `operaads`
3. iOS Adapter Class Name 是否为 `ISOperaAdsCustomAdapter`
4. 实例参数（appid、placementid、operaBundleId）是否正确
5. 查看日志中的详细错误信息

**Q: 适配器类名找不到？**
A: 确保：
1. `IronSourceOperaSDKAdapter` Pod 已正确安装
2. 清理并重新构建项目

## 示例项目

完整的示例项目请参考：
- [OpAdxSDK Demo - Unity Adapter](https://github.com/operaads/iOS-sdk/tree/main/Demo/UnityAdapter)

## 技术支持

- Email: chenl@opera.com
- 文档: [Opera Ads iOS SDK 文档]
- 问题反馈: [GitHub Issues](https://github.com/operaads/IronSourceOperaSDKAdapter/issues)

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 相关链接

- [Opera Ads SDK](https://github.com/operaads/iOS-sdk)
- [Unity LevelPlay 文档](https://developers.is.com/ironsource-mobile/ios/mediation-getting-started-ios/)
- [CocoaPods](https://cocoapods.org/pods/IronSourceOperaSDKAdapter)
