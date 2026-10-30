---
title: Android 正式版建置
description: 用自己的金鑰簽署正式版，並為 Google Play 或 F-Droid 做好準備。
---

## 建立上傳金鑰

正式版以你自己的上傳金鑰簽署。只需建立一次，並妥善保管它與它的密碼：之後每次更新都必須用同一把金鑰簽署。

```bash
keytool -genkeypair -v -keystore ~/balnana-upload.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

接著建立 `app/android/key.properties`（git 會忽略它）：

```properties
storeFile=/home/you/balnana-upload.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

`storeFile` 也可以是相對於 `app/android/` 的路徑。之後 `flutter build apk --release`（或 `appbundle`）就會用這把金鑰簽署。沒有 `key.properties` 時，正式版建置會以錯誤中止。

若只是想試試正式版 APK，可以用除錯金鑰簽署：

```bash
flutter build apk --release --android-project-arg=allowDebugSigning=true
```

:::caution
以除錯金鑰簽署的 APK 無法更新已安裝、正式簽署的 App，反之亦然。
:::

## 上架檢查清單

Google Play 等應用程式商店會要求一些程式碼無法提供的東西：

- **預設伺服器。** 以 `--dart-define=BALNANA_SERVER_URL=https://...` 建置，使用者第一次啟動時就不必輸入網址。
- **隱私權政策網址**，必須公開且不需登入即可存取：把 `BALNANA_PRIVACY_URL` 設為你的政策，或提供商店 `<server>/privacy`，也就是內建聲明。
- **帳號刪除網址**（帳號模式）：`<server>/delete-account`。
- App bundle 的**正式金鑰**：沒有它 `flutter build appbundle` 會拒絕建置。若使用 Play 應用程式簽署，也請把 Play 應用程式簽署憑證的指紋加到 `BALNANA_ANDROID_CERT_SHA256`，讓 [App 連結](/docs/zh-hant/apps/connecting/#app-連結)持續運作。
- **資料安全性表單。** 伺服器會儲存名稱、電子郵件地址、群組的支出與收據照片，以及（啟用推播通知時）每支手機提供的推播服務位址。支出也可能包含地名與座標。App 只有在按下「使用目前位置」後才會要求位置權限，且只有在使用者保留該地點並儲存支出時才會存下。地圖會從營運者選擇的供應商載入圖磚，供應商會收到裝置的網路位址與所請求的地圖範圍。

## F-Droid

App 不含任何專有程式庫，因此可以為 F-Droid 建置。不過在沒有安裝其他分發器時，它內建的推播分發器仍會使用 Google 的 Firebase Cloud Messaging 網路服務，F-Droid 可能會將此標示為反功能（anti-feature）。
