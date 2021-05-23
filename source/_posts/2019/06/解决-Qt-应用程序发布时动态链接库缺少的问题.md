---
title: 解决 Qt 应用程序发布时动态链接库缺少的问题
categories: C++
tags: Qt
abbrlink: 15
date: 2019-06-24 16:29:07
---
首先编译一个 release 版本，然后把生成的可执行文件拷贝到一个新的文件夹下面。

接着找到你的 {% label info@windeployqt.exe %} 文件，例如 {% label info@C:\Qt\5.9.6\mingw53_32\bin\windeployqt.exe %} 。

将 MinGW 添加到环境变量，例如路径  {% label info@C:\Qt\Tools\mingw530_32\bin %} 。

打开命令行窗口，然后进入存放你的可执行文件的文件夹，执行命令：

```
C:\Qt\5.9.6\mingw53_32\bin\windeployqt.exe <可执行文件的文件名> --release
```

这样必要的文件就被放进了该文件夹。
