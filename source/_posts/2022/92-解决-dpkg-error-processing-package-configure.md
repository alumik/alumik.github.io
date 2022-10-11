---
title: '解决 dpkg: error processing package *** (--configure)'
date: 2022-06-15 14:56:15
categories: Linux 系统和软件
tags: dpkg
abbrlink: 92
references:
  - https://bbs.huaweicloud.com/forum/thread-74123-1-1.html
---
## 问题描述

在 Ubuntu 执行 `sudo apt-get` 时，出现了 `dpkg: error processing package *** (--configure)` 的错误。

## 解决方案

通过执行下面的命令可能可以解决该问题：

```
sudo mv /var/lib/dpkg/info/ /var/lib/dpkg/info_old/

sudo mkdir /var/lib/dpkg/info/

sudo apt-get update

sudo apt-get -f install

sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old/

sudo rm -rf /var/lib/dpkg/info

sudo mv /var/lib/dpkg/info_old/ /var/lib/dpkg/info/
```
