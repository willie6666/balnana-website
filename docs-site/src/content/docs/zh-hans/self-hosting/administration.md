---
title: 管理
description: /admin 页面、管理员密码，以及环境变量设置如何与它配合。
---

## 管理页面

`/admin` 会要求输入管理员密码（没有用户名），并显示服务器的设置：

- 公开网址，以及链接模式或账号模式；
- 密码登录与注册；
- 电子邮件（SMTP）；
- Google 与 OpenID Connect 登录；
- Android App 链接；
- 地图与隐私声明；
- [方案与付款](/docs/zh-hans/self-hosting/plans-and-payments/)（开启时）；
- 账号，管理员可以搜索并删除。

更改会立即应用到所有共用同一个数据库的服务器程序。App 中没有任何指向 `/admin` 的链接：请自行输入网址打开。

## 来自环境变量的设置

每项设置也都可以写成 `.env` 里的环境变量。**已设置的变量优先**：`/admin` 会显示它的值，但标为固定。若想改由 `/admin` 管理某项设置，就不要设置该变量。`.env.example` 以 `[admin]` 标出哪些设置可以在 `/admin` 修改。

## 忘记管理员密码

运行：

```bash
docker compose exec balnana /balnana reset-admin
```

这会让所有人退出 `/admin`，并打印一组新的设置码。打开 `/admin`，用这组设置码设置新密码。

## 备份

所有数据都在 PostgreSQL 数据库里：群组、支出、收据、账号、在 `/admin` 所做的设置，以及签署推送通知的密钥。只有 `.env` 不在数据库内，请一并保留副本。请定期备份数据库：

```bash
docker compose exec -T db pg_dump -U balnana -Fc balnana > balnana.dump
```

要恢复备份时，可以在这台服务器上，或在用相同 `.env` 搭建的新服务器上运行：

```bash
docker compose stop balnana
docker compose exec -T db pg_restore -U balnana -d balnana --clean --if-exists --no-owner < balnana.dump
docker compose up -d
```

:::caution
备份含有所有人的数据与密码哈希，请像保护服务器一样保护它。如果丢失推送密钥，手机要重新订阅后才会再收到通知。
:::

## 运行多个服务器

请只运行一个。多个服务器可以共用数据库，但各自计算请求次数、密码尝试次数、认领付款的尝试次数与实时连接数，所以有 N 个服务器时，这些上限会变成设定值的 N 倍。
