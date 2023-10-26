---
title: 在没有 Root 权限的情况下删除或禁用 Android 系统应用
categories: Android
abbrlink: 29
date: 2019-06-24 20:28:11
tags:
---
首先安装并配置好 adb 工具，并选择以下命令中的一条执行。

将 `PACKAGE` 替换为应用包名。

{% code lang:bash %}
adb shell pm block PACKAGE # Kitkat 可用
adb shell pm hide PACKAGE # Lollipop 可用
adb shell pm uninstall --user 0 PACKAGE # Marshmallow 和 Nougat 可用
{% endcode %}

注意第三种命令可能会失效，而且在重新安装或恢复出厂设置之前无法找回被删除的软件。
