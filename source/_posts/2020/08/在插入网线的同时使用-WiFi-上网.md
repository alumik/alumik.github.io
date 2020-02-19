---
title: 在插入网线的同时使用 WiFi 上网
date: 2020-08-29 16:20:06
categories: Windows
tags:
abbrlink: 52
---
The following is a step by step process as to how you can use wireless internet without taking out your ethernet cable out.

1. Open Network and Sharing Centre ("Network Status" Win10).
2. Go to "Change Adapter Settings" ("Change adapter options" Win10).
3. Go to properties of Local Area Network.
4. Click on Internet Protocol version 4 and go to it's properties.
5. Click on Advanced. You will see a block checked there by the name of "Automatic Metric".
6. Uncheck it and then enter 2 in that section.
7. Now, Do the same for the wireless network but enter 1.

Save the setting and you'll be able to use wifi even when your ethernet cable is connected to the LAN.

"Automatic metric" works by prioritizing the connection with the highest link speed. Manaully changing the setting means you can specify which connection you want to give priority to. See ["An explanation of the Automatic Metric feature for IPv4 routes"](https://support.microsoft.com/en-us/help/299540/an-explanation-of-the-automatic-metric-feature-for-ipv4-routes).

---

**参考链接**

- https://superuser.com/questions/740261/connect-to-internet-with-wifi-while-wired-to-a-different-lan-through-ethernet
