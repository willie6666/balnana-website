---
title: 資料與隱私
description: 刪除帳號、群組會發生什麼事，以及還原誤刪的群組。
---

## 刪除帳號

使用者可以在 App 的**設定 → 帳號**中更改或新增電子郵件地址，以及刪除帳號。網頁 `/delete-account` 在登入後也能做到同樣的事，供要求提供刪除連結的應用程式商店使用。管理員可以在 `/admin` → 帳號中搜尋並刪除帳號。

帳號被刪除時：

- 它的成員會留在各自的群組中，變成未認領，因此餘額依然正確；
- 它擁有的群組會轉給加入最久、且有帳號的成員；
- 其他人都無法存取的群組會隨之立即刪除。

群組擁有者（或在連結模式下，任何持有連結的人）可以在群組設定中刪除整個群組。

## 還原已刪除的群組

從 App 刪除群組時會先封存：群組會立刻對所有人消失，但伺服器會保留 **30 天**，之後在每小時的清理中永久刪除。`/admin` 沒有已封存群組的清單，也沒有還原按鈕。在 30 天內，可以在資料庫中清除它的 `archived_at` 來還原。

依名稱尋找：

```bash
docker compose exec db psql -U balnana balnana -c \
  "select id, name, archived_at from groups where archived_at is not null order by archived_at desc"
```

再依連結中的 token（`.../g/<token>`）還原：

```bash
docker compose exec db psql -U balnana balnana -c \
  "update groups set archived_at = null where token = '<token>'"
```

已開啟的 App 會在下次重新載入時看到它。

:::note
隨帳號一起刪除的群組（也就是其他人都無法存取的那些）不會被封存。它們只能從[資料庫備份](/docs/zh-hant/self-hosting/administration/#備份)還原。
:::

## 隱私權聲明

App 會在登入頁面與設定 → 關於中連結隱私權聲明。請把 `BALNANA_PRIVACY_URL`，或 `/admin` 中對應的欄位，設為你自己的政策。未設定時，App 會顯示一份簡短的內建說明，描述伺服器儲存了哪些資料，也可以在 `/privacy` 查看。
