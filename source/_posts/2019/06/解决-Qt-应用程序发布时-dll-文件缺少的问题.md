---
title: 解决 Qt 应用程序发布时 dll 文件缺少的问题
date: 2019-06-24 16:29:07
categories:
- C++
- Qt
tags:
---
首先编译一个 release 版本，然后把生成的 exe 拷贝到一个新的文件夹下面。

接着找到你的文件，例如 *C:\Qt\5.9.6\mingw53_32\bin\windeployqt.exe* 。

将 minGW 添加到环境变量，例如路径 *C:\Qt\Tools\mingw530_32\bin* 。

打开命令行窗口，然后进入存放 exe 文件的文件夹，执行命令

```
windeployqt <exe 文件名> --release
```

这样必要的文件就被放进了软件文件夹。
