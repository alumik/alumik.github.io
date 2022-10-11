---
title: 解决 SSH 登录慢及 ps 或 top 等命令相应时间长的问题
date: 2022-08-21 23:24:22
categories: Linux 系统和软件
tags:
abbrlink: 99
references:
  - https://unix.stackexchange.com/questions/639728/command-top-and-ps-take-a-long-time-to-show-result
  - https://dev.to/fmtweisszwerg/how-to-disable-systemd-timesyncd-ntp-service-via-systemd-5fkd
---
这是由于 `systemd-timesyncd` 被误认为是一个用户 ID 而不是进程名。
使用 `ps -ef` 命令可以发现该问题。例如：

```
root     20366   779  0 21:05 ?        00:00:00 [autocleanStatus] <defunct>
root     20385   757  0 21:05 ?        00:00:00 sshd: git [priv]
<long hang>
62583    20396     1  2 21:06 ?        00:00:00 /lib/systemd/systemd-timesyncd
```

要解决该问题，一般重启即可。
也可以禁用 `systemd-timesyncd` 服务。

```
sudo systemctl stop systemd-timesyncd
sudo systemctl disable systemd-timesyncd
```

要想恢复被禁用的服务，可以使用：

```
sudo systemctl enable systemd-timesyncd
sudo systemctl start systemd-timesyncd
```
