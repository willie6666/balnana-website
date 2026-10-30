---
title: Reverse proxy and limits
description: Serve Balnana over HTTPS behind Caddy, Traefik or nginx, with correct client addresses and live updates.
---

For anything beyond your own machine, put a TLS reverse proxy such as Caddy, Traefik or nginx in front of Balnana.

## Required settings

| Setting | Why |
| --- | --- |
| `BALNANA_PUBLIC_URL=https://balnana.example.com` | Group links and links in emails are built from it. |
| `BALNANA_TRUST_PROXY=true` | The rate limit then sees real client addresses from `X-Forwarded-For`. Without it, every client shares the proxy's address, and one client guessing passwords or group links blocks everyone. |
| `BALNANA_BIND=127.0.0.1` | When the proxy runs on the same machine, Compose then publishes port 8080 on loopback only. |

:::caution
With `BALNANA_TRUST_PROXY=true`, clients must not reach port 8080 except through the proxy, or they can fake their address.
:::

A minimal Caddy setup on the same machine, which also gets the certificate for you:

```caddy
balnana.example.com {
	reverse_proxy 127.0.0.1:8080
}
```

## Live updates

Open groups update live over Server-Sent Events (`/api/v1/g/<token>/events`), so:

- The proxy must not buffer those responses. nginx honours the `X-Accel-Buffering: no` header the server sends; Caddy and Traefik need no setup.
- Serve over **HTTP/2** if you can. Browsers allow only six HTTP/1.1 connections per site, and each open group tab holds one.
- The server sets no overall read timeout, since live updates hold connections open. Let the proxy limit slow clients.

## Rate limits

`BALNANA_RATE_LIMIT` sets API requests a minute per client address (default 600; `0` turns it off). While it is on, each client address may also:

- create 30 groups at once, then one a minute;
- create 10 accounts at once, then six an hour;
- register 20 phones for notifications at once, then 20 a day;
- hold 100 live connections.

Each account may send 20 email invitations at once (then one a minute) and change its email address five times at once (then six an hour), so the server cannot be used to send spam. Each account, and the administrator, may be sent 20 wrong passwords at once, then 30 an hour, wherever they come from. A group sends notifications to at most 200 phones.

The limits are kept in memory by each server process.
