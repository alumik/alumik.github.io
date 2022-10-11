---
title: Fix Logtransport2 Error on Shutdown in Windows
date: 2022-07-30 17:41:15
categories: Windows 系统和软件
tags: Adobe
abbrlink: 94
references:
  - https://www.tecklyfe.com/fix-logtransport2-error-on-shutdown-in-windows-10/
---
If you use Adobe software on Windows, you may run into an issue where you get a `logtransport2` error on shutdown of Windows. The issue is probably that the `LogTransport2.exe` can't connect to its servers to send log data. Adobe offers you a way to opt-out of a few privacy settings through your online account, and once those changes sync back into your Adobe software suite, the `Logtransport2` error on shutdown should be fixed.

In an Adobe app or the Creative Cloud app you can click on your profile icon then click on Adobe Account. As of this article, you can also go directly to your Adobe Account Privacy Settings. To fix the `LogTransport2.exe` error, you'll need to uncheck the box under Desktop And App Usage that says

> Yes, I'd like to share information on how I use Adobe desktop apps.

As a privacy best practice, it is also recommended that you uncheck the box under Machine Learning that says

> Yes, allow my content to be analyzed by Adobe using machine learning techniques.

Once you make these changes, you shouldn't get the `LogTransport2` error when shutting down or rebooting Windows.
