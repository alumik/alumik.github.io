---
title: 为 Ubuntu 20.04 添加清华大学软件源
categories: Linux
tags:
  - Ubuntu
  - 网络加速
abbrlink: 5
date: 2019-06-24 14:55:57
updated: 2020-06-10 15:04:08
---
Ubuntu 的软件源配置文件为 */etc/apt/sources.list* 。首先将系统自带的该文件做个备份。

之后，删除原文件：

```bash
sudo rm /etc/apt/sources.list
```

然后新建文件：

```bash
sudo nano /etc/apt/sources.list
```

输入以下内容并保存，即可使用清华大学软件源镜像。

```
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
```

本镜像仅支持 32 位和 64 位 x86 架构的系统，对于 ARM 或 PowerPC 架构请使用 ubuntu-ports 镜像。

## 参考链接

- https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
