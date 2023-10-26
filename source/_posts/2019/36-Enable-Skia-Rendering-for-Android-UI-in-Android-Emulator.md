---
title: Enable Skia Rendering for Android UI in Android Emulator
categories: Android
abbrlink: 36
date: 2019-06-24 21:22:52
tags:
references:
  - name: Configure Emulator Graphics Rendering and Hardware Acceleration
    url: https://developer.android.com/studio/run/emulator-acceleration#skia-emulator
---
When using images for API 27 or later, the emulator can render the Android UI with [Skia](https://skia.org/), which can render more smoothly and efficiently.

To enable Skia rendering, use the following commands in adb shell:

{% code %}
su
setprop debug.hwui.renderer skiagl
stop
start
{% endcode %}
