---
title: Ubuntu 中安装最新版的 Node.js 和 NPM
date: 2019-06-24 16:31:34
categories:
- [Linux, Ubuntu]
- [JavaScript, Node.js]
tags:
---
## 卸载已安装的 nodejs 和

如果以前安装过老版本的 nodejs 和 npm ，先进行卸载。

```
apt remove npm nodejs
```

进入 */usr/local/bin* 和 */usr/bin* 目录中，若有 node 或者 npm 文件，全部删除。

## 下载安装 Node.js

### 方法一：使用 NodeSource 在线安装（推荐）

[NodeSource 仓库地址](https://github.com/nodesource/distributions)

#### Node.js v10.x:

```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs
```

### 方法二：下载安装包离线安装

去 Node.js 官网下载最新版或者最稳定版的 Linux 安装包。
下载完成后传到机器上，然后解压

```
tar -xJf <压缩包文件名>
```

然后把解压的文件移动到 */opt* 文件夹下。

建立到 */usr/bin/* 目录的链接

```
ln -s /opt/<node 文件夹名>/bin/node /usr/bin/node
```

然后跟 npm 建立执行链接

```
ln -s /opt/<node 文件夹名>/bin/npm /usr/bin/npm
```

此时，我们的环境搭建已经完毕。
