---
title: 设置默认采用 root 用户登录 WSL
categories: Linux 系统和软件
tags: WSL
abbrlink: 11
date: 2019-06-24 15:40:21
---
用管理员身份打开 PowerShell，执行以下命令：

{% code %}
<WSL 发行版代号> config --default-user root
{% endcode %}

目前可用的发行版代号不完全列表如下：

| 发行版代号 | 发行版名称 |
| - | - |
| `ubuntu` | Ubuntu |
| `ubuntu1804` | Ubuntu 18.04 |
| `opensuse-42` | openSUSE Leap 42 |
| `sles-12` | SUSE Linux Enterprise Server 12 |
| `debian` | Debian GNU/Linux |
| `kali` | Kali Linux |
