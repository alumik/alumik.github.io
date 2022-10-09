---
title: 修复 Docker 在 Ubuntu 22.04 中运行 apt update 时出现异常
date: 2022-10-09 18:16:09
categories: 容器与虚拟机
tags:
  - Docker
  - Ubuntu
  - apt
abbrlink: 107
references:
  - https://xyz.uscwifi.xyz/post/PRTc2ZYZx/
  - https://stackoverflow.com/questions/71941032/why-i-cannot-run-apt-update-inside-a-fresh-ubuntu22-04
---
## 问题

在 Ubuntu 22.04 LTS 的容器里面运行 `apt update` 的时候出现了以下报错：

```
[root@VM-16-9-centos docker-kubuntu]# docker run --rm -it ubuntu:22.04 bash
root@8ac245b487e6:/# apt update
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]                    
Err:1 http://security.ubuntu.com/ubuntu jammy-security InRelease                   
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
Err:2 http://archive.ubuntu.com/ubuntu jammy InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [109 kB]
Err:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
Get:4 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [90.7 kB]
Err:4 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
Reading package lists... Done
W: http://security.ubuntu.com/ubuntu/dists/jammy-security/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://security.ubuntu.com/ubuntu/dists/jammy-security/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: GPG error: http://security.ubuntu.com/ubuntu jammy-security InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
E: The repository 'http://security.ubuntu.com/ubuntu jammy-security InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
W: http://archive.ubuntu.com/ubuntu/dists/jammy/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://archive.ubuntu.com/ubuntu/dists/jammy/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: GPG error: http://archive.ubuntu.com/ubuntu jammy InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
E: The repository 'http://archive.ubuntu.com/ubuntu jammy InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
W: http://archive.ubuntu.com/ubuntu/dists/jammy-updates/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://archive.ubuntu.com/ubuntu/dists/jammy-updates/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: GPG error: http://archive.ubuntu.com/ubuntu jammy-updates InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
E: The repository 'http://archive.ubuntu.com/ubuntu jammy-updates InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
W: http://archive.ubuntu.com/ubuntu/dists/jammy-backports/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: http://archive.ubuntu.com/ubuntu/dists/jammy-backports/InRelease: The key(s) in the keyring /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg are ignored as the file is not readable by user '_apt' executing apt-key.
W: GPG error: http://archive.ubuntu.com/ubuntu jammy-backports InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 871920D1991BC93C
E: The repository 'http://archive.ubuntu.com/ubuntu jammy-backports InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
E: Problem executing scripts APT::Update::Post-Invoke 'rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true'
E: Sub-process returned an error code
```

## 原因

经过查询，发现是 Ubuntu 21.10 和 Fedora 35 开始使用 `glibc>=2.34` 甚至更高的版本。在 `glibc` 新版本里面，开始使用一个名为 `clone3` 的系统调用。通常情况下，容器里面所有的系统调用都会被 Docker 捕获，然后 Docker 决定如何处理它们。如果 Docker 中没有为特定系统调用指定策略，则默认的策略会通知容器这边"Permission Denied"。但是，如果 `glibc` 收到此错误，它不会回退。它仅在收到响应“此系统调用不可用”时才执行此操作。

## 解决

办法一：

运行容器的时候，加上这个参数来绕过 Docker 系统调用限制

```
--security-opt seccomp=unconfined
```

不过这会有很大的问题，一个是你的容器将变得不安全，另一个是这些参数在构建镜像的时候是不可用的。所以，请参考办法二。

办法二：

将 Docker 升级到 20.10.8 以上的版本。
