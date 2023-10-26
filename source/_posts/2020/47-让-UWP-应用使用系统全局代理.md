---
title: 让 UWP 应用使用系统全局代理
date: 2020-05-29 20:05:11
categories: 网络服务
tags:
abbrlink: 47
references:
  - https://github.com/shadowsocks/shadowsocks-windows/issues/897#issuecomment-413400908
---
引用自：[#1963 (comment)](https://github.com/shadowsocks/shadowsocks-windows/issues/1963#issuecomment-413378963)

以管理员身份启动 PowerShell 后运行下列命令：

{% code lang:powershell %}
foreach($f in Get-ChildItem $env:LOCALAPPDATA\Packages) {CheckNetIsolation.exe LoopbackExempt -a "-n=$($f.Name)"}
{% endcode %}

如果只需要少量应用：

{% code lang:powershell %}
CheckNetIsolation.exe LoopbackExempt –a –n=<App Directory>
{% endcode %}

将 `<App Directory>` 替换成出现在 *%LOCALAPPDATA%\Packages* 目录中的应用目录名即可。
