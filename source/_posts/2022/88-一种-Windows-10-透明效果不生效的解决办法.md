---
title: 一种 Windows 10 透明效果不生效的解决办法
date: 2022-05-01 17:13:26
categories: Windows 系统和软件
tags:
abbrlink: 88
references:
  - https://shansing.com/read/495/
---
Windows Terminal 某次更新以后，透明效果消失。在系统“颜色”设置中已经将“透明效果”设置为“开”。

观察以后，可以认为透明效果不生效。“设置”界面、开始菜单、计算器程序，都是纯色，没有毛玻璃效果。

## 解决方案

运行注册表编辑器 `regedit`，定位到：

{% code %}
HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize
{% endcode %}

有一个值名称为 `EnableTransparency`，如果已经启用透明，数据应该是 `1`。

接下来改成 `0`。然后关机，再开机。接着将数据值改为 `1`。这时候应该就能看到透明效果回来了。
