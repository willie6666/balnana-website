---
title: 管理
description: 使用 /admin 管理伺服器、把設定移到 .env、重設管理員密碼與備份資料。
---

## 管理頁面

`/admin` 會要求輸入管理員密碼（沒有使用者名稱），並顯示伺服器的設定：

- 公開網址，以及連結模式或帳號模式；
- 密碼登入與註冊；
- 電子郵件（SMTP）；
- Google 與 OpenID Connect 登入；
- Android App 連結；
- 地圖與隱私權聲明；
- [方案與付款](/docs/zh-hant/self-hosting/plans-and-payments/)（開啟時）；
- 帳號，管理員可以搜尋並刪除。

變更會立即套用到所有共用同一個資料庫的伺服器程式。要開啟管理頁面，請在伺服器網址後面加上 `/admin`，App 裡沒有這個入口。

## 來自環境變數的設定

每項設定也都可以寫成 `.env` 裡的環境變數。**有設定的變數優先**：`/admin` 會顯示它的值，但標示為固定。若想改由 `/admin` 管理某項設定，就不要設定該變數。`.env.example` 以 `[admin]` 標示哪些設定可以在 `/admin` 修改。

### 只從 `.env` 讀取設定

若想把所有設定集中在一個檔案裡，請設定：

```ini
BALNANA_ENV_ONLY=true
```

之後伺服器只從環境變數讀取每一項 `[admin]` 設定。在 `/admin` 儲存過的內容會被忽略（但仍留在資料庫裡），`.env` 沒有寫的設定則使用預設值。`/admin` 仍會顯示這些設定，但都變成灰色：**環境設定檔**下的**只從 .env 讀取設定**會顯示為開啟，而且在那裡無法修改任何設定。要修改設定，請改 `.env` 並重新啟動伺服器。

方案、商品、帳號與付款紀錄不是設定，不論是否開啟，都還是在 `/admin` 管理。

這個開關只能在 `.env` 開啟或關閉。開啟時，只要有一項設定伺服器無法接受，伺服器就不會啟動，記錄檔會指出是哪一項。把這一行拿掉並重新啟動後，在 `/admin` 儲存的設定就會再次生效。

### 匯出為 .env

`/admin` 可以把它儲存的設定寫成 `.env` 的內容，開啟 `BALNANA_ENV_ONLY` 之前就不必重新輸入一遍：

1. 在 `/admin` 選擇**匯出為 .env**：頂端列的下載按鈕，或**環境設定檔**下的項目。
2. 再輸入一次管理員密碼。`/admin` 會儲存一個名為 `balnana.env` 的檔案。
3. 把檔案裡的每一行加到伺服器的 `.env`。
4. 在 `.env` 加上 `BALNANA_ENV_ONLY=true`。
5. 重新啟動伺服器，讓它重新讀取檔案：

   ```bash
   docker compose up -d
   ```

檔案包含在 `/admin` 儲存的所有設定，機密也在內：SMTP 密碼、登入提供者的密鑰與付款金鑰。環境變數已經設定的項目不會匯出，因為它們本來就在 `.env` 裡。值的引號寫法同時適用於 Docker Compose 的 `env_file` 與 systemd 的 `EnvironmentFile`；JSON 金鑰（例如 Google Play 服務帳號）會寫成一行。

:::caution
`balnana.env` 和 `.env` 一樣機密。把內容加進 `.env` 後，請刪除下載的檔案。
:::

## 忘記管理員密碼

執行：

```bash
docker compose exec balnana /balnana reset-admin
```

這會讓所有人登出 `/admin`，並印出一組新的設定碼。開啟 `/admin`，用這組設定碼設定新密碼。

## 備份

群組、支出、收據、帳號、管理頁面的設定和推播簽署金鑰，都存在 PostgreSQL 資料庫裡。請定期備份資料庫，也另外留一份 `.env` 的副本：

```bash
docker compose exec -T db pg_dump -U balnana -Fc balnana > balnana.dump
```

要還原備份時，可以在這台伺服器上，或在用相同 `.env` 架設的新伺服器上執行：

```bash
docker compose stop balnana
docker compose exec -T db pg_restore -U balnana -d balnana --clean --if-exists --no-owner < balnana.dump
docker compose up -d
```

:::caution
備份含有所有人的資料與密碼雜湊，請像保護伺服器一樣保護它。如果遺失推播金鑰，手機要重新訂閱後才會再收到通知。
:::

## 執行多個伺服器

請只執行一個。多個伺服器可以共用資料庫，但各自計算請求次數、密碼嘗試次數、認領付款的嘗試次數與即時連線數，所以 N 個伺服器時，這些上限會變成設定值的 N 倍。
