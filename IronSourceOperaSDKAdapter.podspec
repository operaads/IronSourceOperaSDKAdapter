Pod::Spec.new do |spec|
  # ――― 基本信息 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "IronSourceOperaSDKAdapter"
  spec.version      = "2.12.1.0"
  spec.summary      = "Opera Ads Custom Adapter for IronSource (Unity LevelPlay) Mediation Platform."
  spec.description  = <<-DESC
    IronSourceOperaSDKAdapter is a custom mediation adapter that enables the integration of
    Opera Advertising SDK (OpAdxSdk) with the IronSource (Unity LevelPlay) mediation platform.

    Supported Ad Formats:
    - Banner Ads (Standard, MREC)
    - Interstitial Ads
    - Rewarded Ads
    - Native Ads

    This adapter bridges Opera Ads SDK callbacks to IronSource mediation callbacks,
    enabling seamless ad serving through the IronSource platform.
  DESC

  spec.homepage     = "https://github.com/operaads/IronSourceOperaSDKAdapter"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Opera Ads" => "chenl@opera.com" }

  # ――― 平台设置 ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "13.0"
  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.0"

  # ――― 源码位置 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = {
    :git => "https://github.com/operaads/IronSourceOperaSDKAdapter.git",
    :tag => "#{spec.version}"
  }

  # ――― 文件与依赖配置 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # 制作静态包的关键设置
  spec.static_framework = true

  spec.vendored_frameworks = "OpAdxAdapterUnity.xcframework"

  # --- 依赖项 ---
  # IronSource SDK
  spec.dependency 'IronSourceSDK', '>= 9.3.0.0'

  # Opera Ads SDK - 使用CocoaPods发布的版本
  spec.dependency 'OpAdxSdk', '2.12.1'

  # ――― 元数据 ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

end
