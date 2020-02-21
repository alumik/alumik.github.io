---
title: 在 Ubuntu 中安装最新版的 Node.js
categories: JavaScript
tags: Node.js
abbrlink: 16
date: 2019-06-24 16:31:34
updated: 2020-02-20 19:59:56
---
## 卸载已安装的软件包

如果以前安装过老版本的 nodejs 和 npm ，先进行卸载。

```
apt remove npm nodejs --purge
```

进入 */usr/local/bin* 和 */usr/bin* 目录中，若有 node 或者 npm 文件，全部删除。

## 使用 NodeSource 在线安装

[NodeSource 仓库地址](https://github.com/nodesource/distributions)

### Node.js v13.x:

```
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
```

为了加快安装速度，可以切换成清华源（此步可跳过）。

```
sudo nano /etc/apt/sources.list.d/nodesource.list
```

将内容修改为：

```
deb https://mirrors.tuna.tsinghua.edu.cn/nodesource/deb_13.x bionic main
deb-src https://mirrors.tuna.tsinghua.edu.cn/nodesource/deb_13.x bionic main
```

其中， Ubuntu 的版本 `bionic` 请自行根据实际修改。

最后安装 nodejs ：

```
sudo apt update
sudo apt install -y nodejs
```
