---
title: Android 正式版建置
description: 依 App 要上架的地方選擇建置，用自己的金鑰簽署，並為 Google Play 或 F-Droid 做好準備。
---

## 兩種建置

App 有兩個 flavor，使用相同的應用程式 ID。差別在於[方案](/docs/zh-hant/self-hosting/plans-and-payments/)的付款方式，以及 APK 裡是否包含 Google 的封閉式付款程式庫：

- `foss`，預設：不含 Google Play 付款。用於 F-Droid 與直接下載；加上 `--dart-define=BALNANA_EXTERNAL_PAYMENTS=true` 即可連到 Ko-fi。
- `play`：販售 Google Play 訂閱。設定 `BALNANA_EXTERNAL_PAYMENTS` 時會拒絕建置，因為 Google Play 不允許 App 引導使用者到其他地方付款。

```bash
flutter build appbundle --flavor play
flutter build apk --release --flavor foss --dart-define=BALNANA_EXTERNAL_PAYMENTS=true
```

APK 會產生在 `build/app/outputs/flutter-apk/app-<flavor>-release.apk`。

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

`storeFile` 也可以是相對於 `app/android/` 的路徑。之後 `flutter build apk --release`（或 `appbundle --flavor play`）就會用這把金鑰簽署。沒有 `key.properties` 時，正式版建置會以錯誤中止。

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
- App bundle 的**正式金鑰**：沒有它 `flutter build appbundle --flavor play` 會拒絕建置。若使用 Play 應用程式簽署，也請把 Play 應用程式簽署憑證的指紋加到 `BALNANA_ANDROID_CERT_SHA256`，讓 [App 連結](/docs/zh-hant/apps/connecting/#app-連結)持續運作。
- **資料安全性表單。** 伺服器會儲存名稱、電子郵件地址、群組的支出與收據照片、成員填寫的收款資訊，以及（啟用推播通知時）每支手機提供的推播服務位址。支出也可能包含地名與座標。App 只有在按下「使用目前位置」後才會要求位置權限，且只有在使用者保留該地點並儲存支出時才會存下。地圖會從營運者選擇的供應商載入圖磚，供應商會收到裝置的網路位址與所請求的地圖範圍。App 會在手機上保留一份群組資料供離線使用，離線時新增的支出與轉帳也會存在手機上，直到上傳為止。主畫面小工具會顯示使用者選擇的群組名稱，以及他在該群組的餘額。

## F-Droid

`foss` 建置不含任何專有程式庫，因此可以為 F-Droid 建置；F-Droid 的建置設定必須指定 `foss` flavor。不過在沒有安裝其他分發器時，它內建的推播分發器仍會使用 Google 的 Firebase Cloud Messaging 網路服務，F-Droid 可能會將此標示為反功能（anti-feature）。
