---
title: 远程桌面使用 MATLAB 报错 License Manager Error -103 的解决办法
categories: Windows 系统和软件
tags: MATLAB
abbrlink: 35
date: 2019-06-24 21:19:51
references:
  - https://blog.csdn.net/hezhongla0811/article/details/81226539
---
## 问题描述

通过远程桌面访问 Windows 上安装好的 MATLAB 的时候，出现了 License Manager Error -103 的错误。

## 解决办法

这是由于 MATLAB 使用了 FLEXlm 进行 license 管理，而 FLEXlm 不支持从远程桌面访问。不过，对 license 文件稍加修改，就能够使用了。

修改 *安装目录/licenses* 目录下的许可证文件，用任何编辑工具打开 *.lic* 文件，然后在每一行的 `SIGN=xxxxxxxxxx` 前面，加入 `TS_OK` 这个参数（注意 OK 后面有一个空格）。

{% asset_img 20180726200007776.png 修改示例 %}

修改之后即可使用。
