---
title: 重建 Ubuntu 系统被删除的 auth.log 等系统日志文件
date: 2021-08-29 15:21:33
categories: Linux
tags: Ubuntu
abbrlink: 71
references:
  - https://serverfault.com/questions/770984/ubuntu-14-04-auth-log-deleted
---
如果误删除了 */var/log/auth.log* 等系统日志，可以通过重新启动 `rsyslog` 服务重建日志文件。

```
sudo service rsyslog restart
```
