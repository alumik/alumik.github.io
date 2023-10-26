---
title: 在 Ubuntu 中安装最新版的 Node.js
categories: 过期或不适用的文章
tags:
abbrlink: 16
date: 2019-06-24 16:31:34
---
{% note danger %}
该文章内容**已过期**或**不再适用**。

建议使用 [Conda](https://www.anaconda.com/) 安装任意版本的 Node.js。
{% endnote %}

## 卸载已安装的软件包

如果以前安装过老版本的 nodejs 和 npm ，先进行卸载。

{% code %}
apt remove npm nodejs --purge
{% endcode %}

进入 */usr/local/bin* 和 */usr/bin* 目录中，若有 node 或者 npm 文件，全部删除。

## 使用 NodeSource 在线安装

[NodeSource 仓库地址](https://github.com/nodesource/distributions)

### Node.js v13.x:

{% code %}
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
{% endcode %}

为了加快安装速度，可以切换成清华源（此步可跳过）。

{% code %}
sudo nano /etc/apt/sources.list.d/nodesource.list
{% endcode %}

将内容修改为：

{% code %}
deb https://mirrors.tuna.tsinghua.edu.cn/nodesource/deb_13.x bionic main
deb-src https://mirrors.tuna.tsinghua.edu.cn/nodesource/deb_13.x bionic main
{% endcode %}

其中， Ubuntu 的版本 `bionic` 请自行根据实际修改。

最后安装 nodejs ：

{% code %}
sudo apt update
sudo apt install -y nodejs
{% endcode %}
