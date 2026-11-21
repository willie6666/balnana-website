---
title: 构建 iOS 版 Balnana
description: 从源代码构建适用于 iOS 15 及以上的 Balnana，并在 iPhone、iPad 或模拟器上运行。
---

Balnana 计划在 App Store 上架。你可以在 Mac 上用 Xcode 和 [Balnana 使用的 Flutter 版本](https://github.com/willie6666/balnana/blob/main/.github/workflows/ci.yml)从源代码构建。如果要在模拟器上测试，请先在 Xcode 中安装 iOS 模拟器运行环境。项目使用 Swift Package Manager。

如果 `xcode-select -p` 指向 Command Line Tools，请运行 `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer` 切换到 Xcode。

## 在模拟器上运行

在源代码仓库的 `app/` 目录中运行：

```bash
flutter pub get
xcrun simctl list devices available
xcrun simctl boot <simulator-id>
flutter run -d <simulator-id>
```

如果模拟器已经启动，可以跳过 `boot` 命令。首次打开时，请输入官方服务器（`https://app.balnana.com`）或自行部署的服务器地址。如果服务器在同一台 Mac 上运行，模拟器可以通过 `http://127.0.0.1:8080` 连接。

## 在 iPhone 或 iPad 上运行

在 `app/` 目录中运行 `flutter pub get` 和 `flutter build ios --config-only --no-codesign`。用 Xcode 打开 `app/ios/Runner.xcworkspace`，为 **Runner** target 选择签名团队，再选择 **foss** scheme 和已连接的设备。

如果要预填服务器地址，在用 Xcode 构建前，请在 `flutter build ios --config-only --no-codesign` 命令中添加 `--dart-define=BALNANA_SERVER_URL=https://balnana.example.com`。在实体设备上，请使用 Mac 的局域网地址或 HTTPS 服务器。详见[连接 App](/docs/zh-hans/apps/connecting/#ios)。

## 支持的功能

iOS 版支持记账、分摊、记录转账和保存支出地点。在有设置的服务器上，也支持[通过 Apple 登录](/docs/zh-hans/self-hosting/access-and-sign-in/#通过-apple-登录)，并以 [App Store 订阅](/docs/zh-hans/self-hosting/plans-and-payments/#app-store)销售方案，方案页面有 **恢复购买** 与 **管理订阅**。iOS 版一律不显示 Ko-fi 或 PayPal：App Store 只允许以 App 内购买销售方案。iOS 目前未提供推送通知和主屏幕小组件。

使用 Google 或 OpenID Connect 登录时，会在 App 内的浏览器窗口中进行，完成后返回 App。
