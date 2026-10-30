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

所有資料都在 PostgreSQL 資料庫裡：群組、支出、收據、帳號與設定。請定期備份：

```bash
docker compose exec db pg_dump -U balnana balnana > backup.sql
```
