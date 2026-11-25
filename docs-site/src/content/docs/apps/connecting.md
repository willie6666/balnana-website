---
title: Connecting the apps
description: Connect the web, Android and iOS apps to your server and configure a default server when building.
---

## Web

The web app talks to the server that serves it. There is nothing to configure.

## Android

On first launch the app asks for the server address. It can be changed later in **Settings → Server** (the web app has no such setting).

A build can also bake in a default server, so people do not have to type an address:

```bash
flutter build apk --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

### App links

Such a build also opens that server's group, invitation, view-only and email links in the app. For Android to do so without asking, enter the SHA-256 fingerprint of the build's signing certificate under `/admin` → Android app links, or set `BALNANA_ANDROID_CERT_SHA256` (comma separated for several). This prints it:

```bash
keytool -list -v -keystore <your keystore>
```

The server then serves `/.well-known/assetlinks.json`. With Play App Signing, add Play's app signing certificate fingerprint as well.

## iOS

Enter `https://app.balnana.com` or the address of your own server on first launch. You can change it later under **Settings → Server**. If iOS asks for local network access, allow it to connect to a server on your LAN.

See [Build Balnana for iOS](/docs/apps/ios/) for installation and for setting a default server at build time. Google and OpenID Connect sign-in open in a browser sheet inside the app and return to it; [Sign in with Apple](/docs/self-hosting/access-and-sign-in/#sign-in-with-apple) uses the iPhone's own sheet. HTTPS links open as described under [Universal links](#universal-links).

### Universal links

The iOS app opens group, invitation, view-only and email links on `app.balnana.com` in the app. Links to another server open in the browser, unless that server has its own build (below). A link opens in the app only when it is for the server the app is connected to; otherwise the app says the link is for another server.

To make your own build open your server's links:

1. Replace `app.balnana.com` with your server's host in `ios/Runner/Runner.entitlements` (`applinks:balnana.example.com`), and turn on the Associated Domains capability for the App ID in your Apple developer account.
2. Enter the team ID of the Apple developer account that signs the app under `/admin` → iOS app, or set `BALNANA_APPLE_TEAM_ID`. It is 10 capital letters and digits, shown under Membership details.

The server then serves `/.well-known/apple-app-site-association` for the bundle ID set under the same section (`com.balnana.app` if empty). iOS fetches it when the app is installed, so reinstall the app after changing it.

## Web app on another origin

To serve the web app from somewhere other than the server, build it with the server's address:

```bash
flutter build web --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

Then list its origin (scheme, host and port, such as `https://app.example.com`) in `BALNANA_CORS_ORIGINS`.

Browsers keep the server's session cookie from other sites, so such an app keeps a bearer token in the browser's local storage instead, as the Android app keeps one on the phone. Password sign-in works as on the server's own web app. Google and OpenID Connect sign-in come back to the app's `/oauth-done` page with a one-time code, which only works for an origin listed by name: `*` lets any site call the API but sends sign-ins to none. Links in emails still open the server's own web app.
