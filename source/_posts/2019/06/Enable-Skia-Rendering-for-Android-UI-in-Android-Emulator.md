---
title: Enable Skia Rendering for Android UI in Android Emulator
categories: Android
abbrlink: 63805
date: 2019-06-24 21:22:52
tags:
---
When using images for API 27 or later, the emulator can render the Android UI with [Skia](https://skia.org/), which can render more smoothly and efficiently.

To enable Skia rendering, use the following commands in adb shell:

```
su
setprop debug.hwui.renderer skiagl
stop
start
```

---

**参考链接**

+ [Configure Emulator Graphics Rendering and Hardware Acceleration](https://developer.android.com/studio/run/emulator-acceleration#skia-emulator)
