---
title: 向每个 screen 中发送 Ctrl-C 信号
date: 2021-04-19 20:29:39
categories: Linux 系统和软件
tags: Screen
abbrlink: 60
---
使用如下命令：

```sh
for scr in $(screen -ls | awk '{print $1}'); do
  screen -S "$scr" -X stuff "^C"
done
```
