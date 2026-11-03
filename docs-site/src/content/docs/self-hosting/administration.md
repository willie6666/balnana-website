---
title: Administration
description: The /admin page, the administrator password and how settings from the environment interact with it.
---

## The admin page

`/admin` asks for the administrator password (there is no username) and shows the server's settings:

- its public address, and link or accounts mode;
- password sign-in and sign-up;
- email (SMTP);
- Google and OpenID Connect sign-in;
- Android app links;
- maps and the privacy notice;
- [plans and payments](/docs/self-hosting/plans-and-payments/), when turned on;
- accounts, which the administrator can find and delete.

Changes apply at once, on every server process that shares the database. Nothing in the app links to `/admin`: open it by typing the address.

## Settings from the environment

Every setting can also be an environment variable in `.env`. **A variable that is set wins**: `/admin` shows its value but marks it as fixed. Leave a variable out to manage that setting from `/admin` instead. `.env.example` marks with `[admin]` which settings `/admin` can change.

## Lost the administrator password

Run:

```bash
docker compose exec balnana /balnana reset-admin
```

It signs everyone out of `/admin` and prints a new setup code. Open `/admin` and choose a new password with that code.

## Backups

The PostgreSQL database holds everything: groups, expenses, receipts, accounts, the settings made at `/admin` and the key that signs push notifications. Only your `.env` lives outside it, so keep a copy of that too. Back the database up regularly:

```bash
docker compose exec -T db pg_dump -U balnana -Fc balnana > balnana.dump
```

To bring a copy back, on this server or on a new one set up with the same `.env`:

```bash
docker compose stop balnana
docker compose exec -T db pg_restore -U balnana -d balnana --clean --if-exists --no-owner < balnana.dump
docker compose up -d
```

:::caution
A backup holds everyone's data and password hashes, so keep it as private as the server. If the push key is lost, phones get no notifications until they subscribe again.
:::

## Running more than one server

Run one. Several servers can share a database, but each keeps its own count of requests, password guesses, tries at claiming a payment and live connections, so with N servers those limits are N times what is set.
