---
title: 为 VPS 开启 BBR 加速
date: 2019-06-24 14:39:36
categories: Linux
tags: 网络加速
---
先执行

```bash
uname -r
```

看看是不是内核版本 ≥ 4.9 ，如果不是需要先升级内核。

执行

```bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
```

保存生效

```bash
sysctl -p
```

执行

```bash
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```

如果结果都有 `bbr` ，则证明你的内核已开启 BBR ！

此外，执行

```bash
lsmod | grep bbr
```

看到有 `tcp_bbr` 模块即说明 BBR 已启动。
