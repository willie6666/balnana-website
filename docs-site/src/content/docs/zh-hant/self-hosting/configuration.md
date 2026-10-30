---
title: 設定
description: 電子郵件、地圖、推播通知、隱私權聲明與其他伺服器設定。
---

所有設定都放在 `.env`（由 `docker-compose.yml` 讀取）。標示 **admin** 的設定也能在 `/admin` 修改；在 `.env` 設定的變數優先於 `/admin`。

## 伺服器

| 設定 | 預設 | |
| --- | --- | --- |
| `BALNANA_PUBLIC_URL` | `http://localhost:8080` | **admin** · 使用者連線的網址。群組連結以它為基礎。 |
| `BALNANA_PORT` | `8080` | 要開放的主機連接埠（僅限 Compose）。 |
| `BALNANA_BIND` | `0.0.0.0` | 要開放的主機位址。在本機代理後方時請用 `127.0.0.1`。 |
| `BALNANA_LOG_LEVEL` | `info` | `debug`、`info`、`warn` 或 `error`。 |
| `BALNANA_SOURCE_URL` | Balnana 儲存庫 | **admin** · 顯示在設定 → 關於 → 原始碼。若執行修改過的版本，請指向你的原始碼。 |
| `BALNANA_PRIVACY_URL` | — | **admin** · 你自己的隱私權政策，連結會出現在登入頁面與設定 → 關於。未設定時 App 會顯示一份簡短的內建聲明。 |
| `BALNANA_CORS_ORIGINS` | — | 允許呼叫 API 的其他網頁來源。請參閱[連接 App](/docs/zh-hant/apps/connecting/#在其他來源提供網頁版-app)。 |

## 電子郵件

電子郵件用來寄送驗證、重設密碼與邀請信。`BALNANA_SMTP_HOST` 為空時不會啟用。以下都是 **admin** 設定。

```ini
BALNANA_SMTP_HOST=smtp.example.com
BALNANA_SMTP_PORT=587
BALNANA_SMTP_USER=
BALNANA_SMTP_PASSWORD=
BALNANA_SMTP_FROM=Balnana <balnana@example.com>
```

465 連接埠從一開始就使用 TLS；其他連接埠在郵件伺服器支援時會以 STARTTLS 升級。電子郵件中帶有登入連結，因此不提供 TLS 的郵件伺服器會被拒絕，除非它在同一台機器上。`BALNANA_SMTP_ALLOW_PLAINTEXT=true`（僅限 `.env`）仍會寄給你自己網路上的郵件伺服器，但不加密。

## 地圖

支出可以附上地點，並顯示在地圖上。`BALNANA_MAP_SOURCE`（**admin**）決定地圖來源：

- `style`（預設）：來自 MapLibre 樣式 `BALNANA_MAP_STYLE` 的向量地圖。預設是 OpenFreeMap 的 Liberty 樣式，免費且不需金鑰。
- `tiles`：來自 `BALNANA_MAP_TILES` 的點陣圖磚，為包含 `{z}`、`{x}` 與 `{y}` 的網址範本。預設是 OpenStreetMap 自己的圖磚伺服器，依其[圖磚使用政策](https://operations.osmfoundation.org/policies/tiles/)適合少量使用；流量大的伺服器請使用其他供應商或自己的圖磚伺服器。
- `off`：不顯示地圖。地點仍會保留。

`BALNANA_MAP_ATTRIBUTION` 設定每張地圖上顯示的出處標示，依供應商要求填寫。

## 推播通知

當有人新增、修改或刪除與某人有關的支出時，伺服器會通知他的手機。不需要任何設定：伺服器第一次啟動時會自行產生 VAPID 金鑰並存在資料庫中。`BALNANA_PUSH=false` 可關閉通知。

通知是標準的 Web Push 訊息，端對端加密，透過 [UnifiedPush](https://unifiedpush.org/) 傳送。裝有 UnifiedPush 分發器（例如 [ntfy](https://ntfy.sh/)）的手機會透過它接收。否則 App 會使用內建的分發器，在有 Google Play 服務的手機上經由 Google 的 Firebase Cloud Messaging 傳送；App 不含 Firebase SDK，也不需要 Firebase 專案。使用者可以在每台裝置的設定 → 通知中開關通知。

伺服器只會傳送到公開的 `https` 位址。位於你自己網路中的分發器，例如自架在 `http://192.168.1.2` 的 ntfy，需要設定 `BALNANA_PUSH_PRIVATE_ENDPOINTS=true`。

## 不使用 Compose 執行

若要直接執行二進位檔，`.env.example` 也列出了 `BALNANA_LISTEN`、`BALNANA_DATABASE_URL`（或 `DATABASE_URL`）、`BALNANA_DATABASE_PASSWORD`，以及 `BALNANA_WEB_DIR`，用來從磁碟提供 Flutter 網頁版建置，取代內嵌的版本。
