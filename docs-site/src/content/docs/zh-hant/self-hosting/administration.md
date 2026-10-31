---
title: 管理
description: /admin 頁面、管理員密碼，以及環境變數設定如何與它互動。
---

## 管理頁面

`/admin` 會要求輸入管理員密碼（沒有使用者名稱），並顯示伺服器的設定：

- 公開網址，以及連結模式或帳號模式；
- 密碼登入與註冊；
- 電子郵件（SMTP）；
- Google 與 OpenID Connect 登入；
- Android App 連結；
- 地圖與隱私權聲明；
- 帳號，管理員可以搜尋並刪除。

變更會立即套用到所有共用同一個資料庫的伺服器程式。App 中沒有任何連到 `/admin` 的連結：請自行輸入網址開啟。

## 來自環境變數的設定

每項設定也都可以寫成 `.env` 裡的環境變數。**有設定的變數優先**：`/admin` 會顯示它的值，但標示為固定。若想改由 `/admin` 管理某項設定，就不要設定該變數。`.env.example` 以 `[admin]` 標示哪些設定可以在 `/admin` 修改。

## 忘記管理員密碼

執行：

```bash
docker compose exec balnana /balnana reset-admin
```

這會讓所有人登出 `/admin`，並印出一組新的設定碼。開啟 `/admin`，用這組設定碼設定新密碼。

## 備份

所有資料都在 PostgreSQL 資料庫裡：群組、支出、收據、帳號、在 `/admin` 所做的設定，以及簽署推播通知的金鑰。只有 `.env` 不在資料庫內，請一併保留副本。請定期備份資料庫：

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
