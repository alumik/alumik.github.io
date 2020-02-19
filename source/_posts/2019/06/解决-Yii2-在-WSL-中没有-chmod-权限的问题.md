---
title: 解决 Yii2 在 WSL 中没有 chmod 权限的问题
categories: Linux
tags:
  - Yii2
  - WSL
abbrlink: 7
date: 2019-06-24 15:26:53
---
执行下列命令即可：

```bash
umount /mnt/x
mount -t drvfs X: /mnt/x -o metadata
```
