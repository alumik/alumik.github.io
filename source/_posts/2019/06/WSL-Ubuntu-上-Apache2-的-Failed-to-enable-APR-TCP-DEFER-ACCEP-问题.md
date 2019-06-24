---
title: WSL (Ubuntu) 上 Apache2 的 Failed to enable APR_TCP_DEFER_ACCEP 问题
date: 2019-06-24 15:53:26
categories:
- [HTTP 服务器]
- [WSL]
tags:
---
## 问题描述

WSL 安装 Apache2 后启动 Apache2 服务会提示以下错误

```
Invalid argument: AH00076: Failed to enable APR_TCP_DEFER_ACCEP
```

## 解决办法

```
nano /etc/apache2/apache2.conf
```

在文件的最底部加上一行以下内容

```apache
AcceptFilter http none
```

然后重启 Apache2 。
