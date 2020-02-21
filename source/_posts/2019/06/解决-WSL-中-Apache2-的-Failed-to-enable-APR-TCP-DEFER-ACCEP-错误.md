---
title: 解决 WSL 中 Apache2 的 Failed to enable APR_TCP_DEFER_ACCEP 错误
categories: 网络服务
tags:
  - Apache2
  - WSL
abbrlink: 13
date: 2019-06-24 15:53:26
updated: 2020-02-21 14:49:07
---
## 问题描述

WSL 安装 Apache2 后启动服务会报出以下错误：

```
Invalid argument: AH00076: Failed to enable APR_TCP_DEFER_ACCEP
```

## 解决办法

打开 Apache2 配置文件：

```
nano /etc/apache2/apache2.conf
```

在文件的最底部添加以下内容：

```apache
AcceptFilter http none
```

然后重启 Apache2 。
