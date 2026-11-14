---
title: Connecting the apps
description: Point the web and Android apps at your server, and build them with a default server.
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

Such a build also opens that server's group, invitation and email links in the app. For Android to do so without asking, enter the SHA-256 fingerprint of the build's signing certificate under `/admin` → Android app links, or set `BALNANA_ANDROID_CERT_SHA256` (comma separated for several). This prints it:

```bash
keytool -list -v -keystore <your keystore>
```

The server then serves `/.well-known/assetlinks.json`. With Play App Signing, add Play's app signing certificate fingerprint as well.

## Web app on another origin

To serve the web app from somewhere other than the server, build it with the server's address:

```bash
flutter build web --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

Then list its origin (scheme, host and port, such as `https://app.example.com`) in `BALNANA_CORS_ORIGINS`.

Browsers keep the server's session cookie from other sites, so such an app keeps a bearer token in the browser's local storage instead, as the Android app keeps one on the phone. Password sign-in works as on the server's own web app. Google and OpenID Connect sign-in come back to the app's `/oauth-done` page with a one-time code, which only works for an origin listed by name: `*` lets any site call the API but sends sign-ins to none. Links in emails still open the server's own web app.
