---
title: 方案與付款
description: 設定每個方案的限制，並透過 Ko-fi 或 Google Play 收款。
---

方案預設關閉，關閉時伺服器不做任何限制。方案需要[帳號模式](/docs/zh-hant/self-hosting/access-and-sign-in/)。在 `/admin` 的**方案與付款**下開啟**方案與限制**，再到**方案**設定每個方案允許的內容：

- **每個群組的收據照片**與**每個群組的定期支出**；
- 一個帳號**加入的群組**（不論是誰建立的），以及**每個群組的人數**；
- **分享方案的群組**：一個帳號能讓多少個群組套用自己的方案。

限制留空代表不限。恰好一個方案是預設方案，套用在沒有其他方案的每個帳號上。帳號有多個方案時，使用順位最高的那個。

記帳本身永遠免費：支出、分帳、結清、統計、CSV 匯出、推播與即時更新都不受限制。新的限制只會擋下之後新增的內容，方案結束時也不會刪除任何東西。

群組的限制來自把方案分享給它的成員，只要對方仍是成員、方案仍有效。否則就使用預設方案。[Settle Up 匯入](/docs/zh-hant/guides/import-settle-up/)的人數若超過預設方案允許的上限，從一開始就會套用匯入者的方案。

## Ko-fi

1. 把 **Ko-fi 頁面**設為你的 `https://ko-fi.com/...` 網址。
2. 在 Ko-fi 的 webhook 設定中，把網址填為 `<公開網址>/api/v1/webhooks/kofi`。`/admin` 會顯示確切的網址。公開網址必須是 `https://`。
3. 把 Ko-fi 的驗證權杖複製到 **Ko-fi 驗證權杖**。設定之前，webhook 一律回應 404。
4. 在**方案**下，為每樣販售的東西新增一個商品。有等級名稱的商品對應該等級的 Ko-fi 會員付款，不分大小寫。沒有等級名稱的商品對應任何金額至少達到它、幣別相同的單次或每月付款。

付款會以下列三種方式之一歸到帳號：

- **付款代碼。** **方案**頁面會給每個人一組像 `BAL-7KQ2M9XP` 的代碼，讓他們貼在 Ko-fi 留言中。伺服器會從留言讀出代碼，不會保存留言。
- **交易 ID。** 忘記留代碼的人，可以在同一頁的**忘記留代碼？**下輸入該筆付款的 Ko-fi 交易 ID，或含有它的連結。
- **訂閱續費。** 續費沒有留言可依據，因此當某筆訂閱付款以上述任一方式歸到帳號後，伺服器會記住 Ko-fi 回報的電子郵件地址，之後來自該地址的訂閱付款都歸給同一個帳號。沒有人需要輸入這個地址，它也不必是帳號本身的地址，單次付款也從不依它歸屬。

每筆付款會把它的天數加到剩餘天數上。

**付款紀錄**列出 Ko-fi 送來的所有付款。*待認領*代表還不知道是誰的，*未對應*代表沒有符合的商品；兩者都可以用**提供給帳戶**手動處理。Ko-fi 不會回報退款：退款給某人後，請到**帳戶**撤銷他的方案。

只有網頁版，以及設定為連到 Ko-fi 的 Android 建置（見 [Android 正式版建置](/docs/zh-hant/apps/android/#兩種建置)），會顯示 Ko-fi 頁面。其他版本只顯示方案與它的限制。

## Google Play

只有 App 的 `play` 建置會販售 Google Play 訂閱（見 [Android 正式版建置](/docs/zh-hant/apps/android/#兩種建置)），而且只限你上架時使用的套件名稱。

1. 在 Play Console 建立訂閱，並為每個訂閱啟用一個基本方案。
2. 在 Google Cloud 建立一個服務帳號及它的 JSON 金鑰。在 Play Console 的**使用者和權限**下邀請它，並給予查看財務資料、管理訂單和訂閱的權限。
3. 在**方案與付款**下設定 **Google Play 套件名稱**，並把金鑰貼到 **Google Play 服務帳號**。兩者都設定後，Google Play 就會開啟。
4. 在**方案**下新增商品，**付款方式**選 Google Play，填入 Play Console 中的**產品 ID**，以及它購買的方案。Google Play 會告知每筆付款何時結束，因此商品沒有自己的天數。
5. 若要讓續費與取消自動送達，請建立一個 Pub/Sub 主題，給 `google-play-developer-notifications@system.gserviceaccount.com` 該主題的 Pub/Sub 發布者角色，再到 Play Console 的**營利設定**填入這個主題。接著新增一個推送到 `<公開網址>/api/v1/webhooks/play` 的推送訂閱，開啟驗證，以同一個網址作為目標對象，並使用你自己的服務帳號；把那個帳號的電子郵件填為 **Pub/Sub 推送帳號**。沒有這些設定時，續費只會在擁有者打開方案頁面時才送達。

伺服器會向 Google 查證每筆購買，不採信其他來源，因此在 Play Console 做的退款與撤銷也會同樣送達。在**帳戶**撤銷方案後，即使 Google 再次回報該筆購買，撤銷仍然有效，但這不會停止訂閱：請一併在 Play Console 取消。

## 付款紀錄

每筆付款都會保存付款人的電子郵件與名稱。設定 `BALNANA_PAYMENT_KEEP_DAYS` 後，它們會在那麼多天後清除；金額、日期與方案則會保留，即使帳號已刪除。之後未認領的付款只能用代碼或交易 ID 認領。請依你所在國家對銷售紀錄的要求決定天數，並寫在你的隱私權政策中。未設定或設為 0 時，會永久保存。

## 設定

除了最後一項，以下都是 **admin** 設定：也可以寫在 `.env` 中，且 `.env` 的值優先於 `/admin`（見[設定](/docs/zh-hant/self-hosting/configuration/)）。

| 設定 | 在 `/admin` 中 | |
| --- | --- | --- |
| `BALNANA_BILLING_ENABLED` | 方案與限制 | 設為 `true` 開啟方案。需要 `BALNANA_AUTH_MODE=accounts`。 |
| `BALNANA_KOFI_URL` | Ko-fi 頁面 | `https://` 網址。需與權杖一起設定。 |
| `BALNANA_KOFI_TOKEN` | Ko-fi 驗證權杖 | |
| `BALNANA_PLAY_PACKAGE` | Google Play 套件名稱 | |
| `BALNANA_PLAY_SERVICE_ACCOUNT` | Google Play 服務帳號 | 服務帳號的 JSON 金鑰。 |
| `BALNANA_PLAY_PUSH_ACCOUNT` | Pub/Sub 推送帳號 | |
| `BALNANA_PAYMENT_KEEP_DAYS` | — | 只能寫在 `.env`。見[付款紀錄](#付款紀錄)。 |
