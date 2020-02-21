---
title: '<span style="text-decoration:line-through">gdrive 使用教程</span>'
categories: 过期或不适用的文章
abbrlink: 49317
date: 2019-06-24 11:39:41
updated: 2020-02-21 13:47:04
tags:
---
{% note danger %}
该文章内容已过期或不再适用。
{% endnote %}

gdrive 是一个好用的 Linux 平台 Google Drive 客户端。

## 安装 gdrive

```
wget -O /usr/bin/gdrive "//docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download"
chmod +x /usr/bin/gdrive
```

## 授权

```
gdrive about
```

然后会出现一个网址并询问验证码。将地址粘贴到浏览器并登录账号，会返回一串代码。

将代码粘贴到控制台下，然后会返回你的 Google 账户信息。

gdrive 会自动将你的 token 保存在用户目录下的 *.gdrive* 目录中，所以如果不需要了记得把这个文件删掉。

## 使用

```
gdrive help
```

可以查看帮助。
