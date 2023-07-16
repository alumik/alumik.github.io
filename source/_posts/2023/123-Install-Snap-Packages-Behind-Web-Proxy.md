---
title: Install Snap Packages Behind Web Proxy
date: 2023-03-03 04:00:49
categories: Linux 系统和软件
tags: snap
abbrlink: 123
references:
  - https://askubuntu.com/questions/764610/how-to-install-snap-packages-behind-web-proxy
---
A system option was added in snap 2.28 to specify the proxy server.

```sh
sudo snap set system proxy.http="http://<proxy_addr>:<proxy_port>"
sudo snap set system proxy.https="http://<proxy_addr>:<proxy_port>"
```
