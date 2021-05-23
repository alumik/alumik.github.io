---
title: 为 VPS 开启 BBR 加速
categories: Linux
tags: 网络加速
abbrlink: 4
date: 2019-06-24 14:39:36
---
先执行：

```sh
uname -r
```

看看内核版本是不是 ≥ 4.9 ，如果不是需要先升级内核。

如果满足条件，执行：

```sh
sudo echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sudo sysctl -p
```

然后验证开启状态，执行：

```sh
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```

如果结果都有 `bbr` ，则证明你的内核已成功开启 BBR ！

此外，执行：

```sh
lsmod | grep bbr
```

看到有 `tcp_bbr` 模块也可说明 BBR 已启动。
