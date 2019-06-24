---
title: 使用淘宝源加速 npm 下载
date: 2019-06-24 16:50:11
categories:
- JavaScript
- Node.js
tags:
---
[淘宝 npm 地址](http://npm.taobao.org/)

有很多方法来配置 npm 的 registry 地址，下面根据不同情境列出几种比较常用的方法。以淘宝 npm 镜像举例。

## 临时使用

```
npm --registry https://registry.npm.taobao.org install xxx
```

## 持久使用

```
npm config set registry https://registry.npm.taobao.org
```

配置后可通过下面方式来验证是否成功

```
npm config get registry
```

## 通过 cnpm 使用

```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
