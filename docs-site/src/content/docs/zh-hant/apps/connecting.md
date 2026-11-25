---
title: 連接 App
description: 讓網頁版、Android 與 iOS App 連到你的伺服器，並在建置時指定預設伺服器。
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

這樣的建置也會在 App 中開啟該伺服器的群組、邀請、僅供檢視與電子郵件連結。若要讓 Android 不經詢問直接開啟，請在 `/admin` → Android App 連結中輸入該建置簽署憑證的 SHA-256 指紋，或設定 `BALNANA_ANDROID_CERT_SHA256`（多個以逗號分隔）。以下指令會印出指紋：

```bash
keytool -list -v -keystore <你的 keystore>
```

接著伺服器就會提供 `/.well-known/assetlinks.json`。若使用 Play 應用程式簽署，也請加上 Play 應用程式簽署憑證的指紋。

## iOS

第一次開啟時，請輸入 `https://app.balnana.com` 或你自行架設的伺服器網址。日後可在**設定 → 伺服器**變更。若 iOS 詢問是否允許取用區域網路，請允許，App 才能連到同一個區域網路內的伺服器。

安裝與預設伺服器的設定方式請見[建置 iOS 版 Balnana](/docs/zh-hant/apps/ios/)。Google 與 OpenID Connect 登入會在 App 內的瀏覽器視窗中進行，完成後回到 App；[使用 Apple 登入](/docs/zh-hant/self-hosting/access-and-sign-in/#使用-apple-登入)則使用 iPhone 本身的登入畫面。HTTPS 連結的開啟方式請見[通用連結](#通用連結)。

### 通用連結

iOS App 會在 App 中開啟 `app.balnana.com` 上的群組、邀請、僅供檢視與電子郵件連結。其他伺服器的連結會在瀏覽器中開啟，除非那台伺服器有自己的建置（見下方）。只有連結屬於 App 目前連線的伺服器時才會在 App 中開啟；否則 App 會說明這是另一台伺服器的連結。

若要讓你自己的建置開啟你伺服器的連結：

1. 在 `ios/Runner/Runner.entitlements` 中把 `app.balnana.com` 換成你伺服器的主機（`applinks:balnana.example.com`），並在 Apple 開發者帳號中為該 App ID 開啟 Associated Domains 功能。
2. 在 `/admin` → iOS App 中輸入簽署 App 的 Apple 開發者帳號團隊 ID，或設定 `BALNANA_APPLE_TEAM_ID`。它由 10 個大寫英文字母與數字組成，可在 Membership details 中找到。

接著伺服器就會為同一區塊設定的 Bundle ID（留空則為 `com.balnana.app`）提供 `/.well-known/apple-app-site-association`。iOS 會在安裝 App 時讀取它，因此更改後請重新安裝 App。

## 在其他來源提供網頁版 App

若要從伺服器以外的地方提供網頁版 App，請用伺服器網址建置：

```bash
flutter build web --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

然後把它的來源（協定、主機與連接埠，例如 `https://app.example.com`）列在 `BALNANA_CORS_ORIGINS` 中。

瀏覽器不會把伺服器的工作階段 Cookie 交給其他網站，所以這樣的 App 改把 bearer token 存在瀏覽器的本機儲存空間，就像 Android App 把它存在手機上一樣。密碼登入與在伺服器自己的網頁版上相同。Google 與 OpenID Connect 登入會帶著一次性代碼回到 App 的 `/oauth-done` 頁面，這只對明確列出名稱的來源有效：`*` 允許任何網站呼叫 API，但不會把登入送回任何一個。電子郵件中的連結仍會開啟伺服器自己的網頁版。
