---
title: 为 Ubuntu 18.04 添加清华大学软件源
date: 2019-06-24 14:55:57
categories:
- Linux
- Ubuntu
tags:
---
Ubuntu 的软件源配置文件为 */etc/apt/sources.list* 。首先将系统自带的该文件做个备份。

之后，删除原文件

```bash
rm /etc/apt/sources.list
```

然后新建文件

```bash
nano /etc/apt/sources.list
```

输入以下内容并保存，即可使用清华大学软件源镜像。

```
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
```
