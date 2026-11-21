---
title: 建置 iOS 版 Balnana
description: 從原始碼建置 iOS 15 以上的 Balnana，並在 iPhone、iPad 或模擬器上執行。
---

Balnana 預計在 App Store 上架。你可以在 Mac 上用 Xcode 和 [Balnana 採用的 Flutter 版本](https://github.com/willie6666/balnana/blob/main/.github/workflows/ci.yml)從原始碼建置。若要在模擬器上測試，請先在 Xcode 安裝 iOS 模擬器執行環境。專案使用 Swift Package Manager。

若 `xcode-select -p` 指向 Command Line Tools，請執行 `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer` 切換到 Xcode。

## 在模擬器執行

在原始碼儲存庫的 `app/` 目錄執行：

```bash
flutter pub get
xcrun simctl list devices available
xcrun simctl boot <simulator-id>
flutter run -d <simulator-id>
```

若模擬器已經啟動，可跳過 `boot` 指令。第一次開啟時，請輸入官方伺服器（`https://app.balnana.com`）或自架伺服器的網址。若伺服器在同一台 Mac 上執行，模擬器可透過 `http://127.0.0.1:8080` 連線。

## 在 iPhone 或 iPad 執行

在 `app/` 目錄執行 `flutter pub get` 與 `flutter build ios --config-only --no-codesign`。用 Xcode 開啟 `app/ios/Runner.xcworkspace`，為 **Runner** target 選擇簽署團隊，再選擇 **foss** scheme 和已連接的裝置。

若要預填伺服器網址，在用 Xcode 建置前，請在 `flutter build ios --config-only --no-codesign` 指令加上 `--dart-define=BALNANA_SERVER_URL=https://balnana.example.com`。在實機上，請使用 Mac 的區域網路位址或 HTTPS 伺服器。詳見[連接 App](/docs/zh-hant/apps/connecting/#ios)。

## 支援功能

iOS 版支援記帳、分攤、記錄轉帳與儲存支出地點。iOS 目前未提供推播通知、主畫面小工具和 Google Play 付款。外部付款連結預設隱藏。
