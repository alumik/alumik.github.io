---
title: 查看 Windows 10 保存的 Wi-Fi 密码
date: 2021-05-24 10:33:39
categories: Windows 系统和软件
tags:
abbrlink: 67
---
当 Windows 10 连接过某个 Wi-Fi 后，这个 Wi-Fi 热点的 SSID、密码等信息就会保存到系统当中，之后再度进入到 Wi-Fi 范围可以自动连接。然而，已经保存在系统的 Wi-Fi，却不能直接查看密码。

使用下列命令可以查看 Windows 10 保存的 Wi-Fi 密码：

{% code %}
netsh wlan show profile name=<SSID> key=clear
{% endcode %}

其中，`SSID` 就填写你想要查看密码的 Wi-Fi 热点的名称。例如笔者想要查看 `HUAWEI Mate 30` 这个热点的密码，则输入：

{% code %}
netsh wlan show profile name="HUAWEI Mate 30" key=clear
{% endcode %}

{% asset_img 01.png 400 %}

在显示出来的“安全设置”一栏当中，“关键内容”所显示的，就是该 Wi-Fi 热点对应的密码了。
