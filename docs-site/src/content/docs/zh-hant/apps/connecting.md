---
title: 連接 App
description: 讓網頁版與 Android App 連到你的伺服器，並建置內建預設伺服器的版本。
---

## 網頁版

網頁版 App 會連到提供它的那台伺服器，不需要任何設定。

## Android

第一次啟動時，App 會詢問伺服器網址。之後可以在**設定 → 伺服器**中更改（網頁版沒有這個設定）。

建置時也可以內建預設伺服器，使用者就不必自己輸入網址：

```bash
flutter build apk --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

### App 連結

這樣的建置也會在 App 中開啟該伺服器的群組、邀請與電子郵件連結。若要讓 Android 不經詢問直接開啟，請在 `/admin` → Android App 連結中輸入該建置簽署憑證的 SHA-256 指紋，或設定 `BALNANA_ANDROID_CERT_SHA256`（多個以逗號分隔）。以下指令會印出指紋：

```bash
keytool -list -v -keystore <你的 keystore>
```

接著伺服器就會提供 `/.well-known/assetlinks.json`。若使用 Play 應用程式簽署，也請加上 Play 應用程式簽署憑證的指紋。

## 在其他來源提供網頁版 App

若要從伺服器以外的地方提供網頁版 App，請用伺服器網址建置：

```bash
flutter build web --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

然後把它的來源（協定、主機與連接埠，例如 `https://app.example.com`）列在 `BALNANA_CORS_ORIGINS` 中。

瀏覽器不會把伺服器的工作階段 Cookie 交給其他網站，所以這樣的 App 改把 bearer token 存在瀏覽器的本機儲存空間，就像 Android App 把它存在手機上一樣。密碼登入與在伺服器自己的網頁版上相同。Google 與 OpenID Connect 登入會帶著一次性代碼回到 App 的 `/oauth-done` 頁面，這只對明確列出名稱的來源有效：`*` 允許任何網站呼叫 API，但不會把登入送回任何一個。電子郵件中的連結仍會開啟伺服器自己的網頁版。
