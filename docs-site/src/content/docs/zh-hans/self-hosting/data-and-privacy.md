---
title: 数据与隐私
description: 删除账号、群组会发生什么，以及恢复误删的群组。
---

## 删除账号

用户可以在 App 的**设置 → 账号**中更改或添加电子邮件地址，以及删除账号。网页 `/delete-account` 在登录后也能做到同样的事，供要求提供删除链接的应用商店使用。管理员可以在 `/admin` → 账号中搜索并删除账号。

账号被删除时：

- 它的成员会留在各自的群组中，变成未认领，因此余额依然正确；
- 它拥有的群组会转给加入最久、且有账号的成员；
- 其他人都无法访问的群组会随之立即删除。

群组的任何成员（或在链接模式下，任何持有链接的人）都可以在群组设置中删除整个群组。

## 恢复已删除的群组

从 App 删除群组时会先归档：群组会立刻对所有人消失，但服务器会保留 **30 天**，之后在每小时的清理中永久删除。`/admin` 没有已归档群组的列表，也没有恢复按钮。在 30 天内，可以在数据库中清除它的 `archived_at` 来恢复。

按名称查找：

```bash
docker compose exec db psql -U balnana balnana -c \
  "select id, name, archived_at from groups where archived_at is not null order by archived_at desc"
```

再按链接中的 token（`.../g/<token>`）恢复：

```bash
docker compose exec db psql -U balnana balnana -c \
  "update groups set archived_at = null where token = '<token>'"
```

已打开的 App 会在下次重新加载时看到它。

:::note
随账号一起删除的群组（也就是其他人都无法访问的那些）不会被归档。它们只能从[数据库备份](/docs/zh-hans/self-hosting/administration/#备份)恢复。
:::

## 收款信息

旧版可以让成员填写收款信息，例如银行账户、支付 App 或链接。这项功能已经移除，升级时会删除已填写的数据。成员之间记录的付款会变成“转账”分类的普通支出，由一人替另一人支付，所以余额不变。

## 隐私声明

官方服务的数据处理方式请参阅 [Balnana 隐私权政策](/zh/privacy)。这份政策不适用于其他人运营的自托管服务器；自托管运营者应提供自己的政策及联系方式。

App 会在登录页面与设置 → 关于中链接隐私声明。请把 `BALNANA_PRIVACY_URL`，或 `/admin` 中对应的字段，设为你自己的政策。未设置时，App 会显示一份简短的内置说明，描述服务器存储了哪些数据，也可以在 `/privacy` 查看。
