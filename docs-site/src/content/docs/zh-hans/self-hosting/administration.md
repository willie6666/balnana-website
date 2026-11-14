---
title: 管理
description: 使用 /admin 管理服务器、把设置移到 .env、重置管理员密码与备份数据。
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

更改会立即应用到所有共用同一个数据库的服务器程序。要打开管理页面，请在服务器网址后面加上 `/admin`，App 里没有这个入口。

## 来自环境变量的设置

每项设置也都可以写成 `.env` 里的环境变量。**已设置的变量优先**：`/admin` 会显示它的值，但标为固定。若想改由 `/admin` 管理某项设置，就不要设置该变量。`.env.example` 以 `[admin]` 标出哪些设置可以在 `/admin` 修改。

### 仅从 `.env` 读取设置

若想把所有设置集中在一个文件里，请设置：

```ini
BALNANA_ENV_ONLY=true
```

之后服务器只从环境变量读取每一项 `[admin]` 设置。在 `/admin` 保存过的内容会被忽略（但仍留在数据库里），`.env` 没有写的设置则使用默认值。`/admin` 仍会显示这些设置，但都变成灰色：**环境配置文件**下的**仅从 .env 读取设置**会显示为开启，而且在那里无法修改任何设置。要修改设置，请改 `.env` 并重启服务器。

方案、商品、账号与付款记录不是设置，不论是否开启，都还是在 `/admin` 管理。

这个开关只能在 `.env` 开启或关闭。开启时，只要有一项设置服务器无法接受，服务器就不会启动，日志会指出是哪一项。把这一行去掉并重启后，在 `/admin` 保存的设置就会再次生效。

### 导出为 .env

`/admin` 可以把它保存的设置写成 `.env` 的内容，开启 `BALNANA_ENV_ONLY` 之前就不必重新输入一遍：

1. 在 `/admin` 选择**导出为 .env**：顶部栏的下载按钮，或**环境配置文件**下的条目。
2. 再输入一次管理员密码。`/admin` 会保存一个名为 `balnana.env` 的文件。
3. 把文件里的每一行加到服务器的 `.env`。
4. 在 `.env` 加上 `BALNANA_ENV_ONLY=true`。
5. 重启服务器，让它重新读取文件：

   ```bash
   docker compose up -d
   ```

文件包含在 `/admin` 保存的所有设置，机密也在内：SMTP 密码、登录提供方的密钥与付款密钥。环境变量已经设置的项目不会导出，因为它们本来就在 `.env` 里。值的引号写法同时适用于 Docker Compose 的 `env_file` 与 systemd 的 `EnvironmentFile`；JSON 密钥（例如 Google Play 服务账号）会写成一行。

:::caution
`balnana.env` 和 `.env` 一样机密。把内容加进 `.env` 后，请删除下载的文件。
:::

## 忘记管理员密码

运行：

```bash
docker compose exec balnana /balnana reset-admin
```

这会让所有人退出 `/admin`，并打印一组新的设置码。打开 `/admin`，用这组设置码设置新密码。

## 备份

群组、支出、收据、账号、管理页面的设置和推送签名密钥，都保存在 PostgreSQL 数据库里。请定期备份数据库，也另外留一份 `.env` 的副本：

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
