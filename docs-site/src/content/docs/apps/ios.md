---
title: Build Balnana for iOS
description: Build Balnana from source for iOS 15 or later and run it on an iPhone, iPad or simulator.
---

An App Store release is planned. You can build the app from source on a Mac with Xcode and the [Flutter version used by Balnana](https://github.com/willie6666/balnana/blob/main/.github/workflows/ci.yml). Install an iOS Simulator runtime in Xcode to test without a device. The project uses Swift Package Manager.

If `xcode-select -p` points to Command Line Tools, select Xcode with `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`.

## Run on a simulator

From the repository's `app/` directory, run:

```bash
flutter pub get
xcrun simctl list devices available
xcrun simctl boot <simulator-id>
flutter run -d <simulator-id>
```

If the simulator is already running, skip the boot command. On first launch, enter the official server (`https://app.balnana.com`) or your own server. The simulator can reach a server running on your Mac at `http://127.0.0.1:8080`.

## Run on an iPhone or iPad

From `app/`, run `flutter pub get` and `flutter build ios --config-only --no-codesign`. Open `app/ios/Runner.xcworkspace` in Xcode, choose your signing team for the **Runner** target, then select the **foss** scheme and your connected device.

To prefill a server address, add `--dart-define=BALNANA_SERVER_URL=https://balnana.example.com` to the `flutter build ios --config-only --no-codesign` command before building in Xcode. On a physical device, use your Mac's LAN address or an HTTPS server. See [Connecting the apps](/docs/apps/connecting/#ios).

## Features

The iOS build supports core expense tracking, splits, transfers and saving a location on an expense. On a server that sets it up, it also has [Sign in with Apple](/docs/self-hosting/access-and-sign-in/#sign-in-with-apple) and sells plans as [App Store subscriptions](/docs/self-hosting/plans-and-payments/#app-store), with **Restore purchases** and **Manage subscription** on the Plan page. It never shows Ko-fi or PayPal: the App Store only allows its own In-App Purchase for plans. Push notifications and home screen widgets are unavailable on iOS.

Sign-in with Google or an OpenID Connect provider opens in a browser sheet inside the app and returns to it when done.
