---
title: 在 Windows 上为 SSH 设置代理
date: 2023-03-16 03:26:19
categories: Windows 系统和软件
tags: SSH
abbrlink: 126
references:
  - https://sianx.com/posts/1257f843/
---
使用命令

```sh
ssh -o ProxyCommand='"C:\Program Files\Git\mingw64\bin\connect.exe" -S 127.0.0.1:1080 %h %p' remoteuser@remotehost
```

这里 Git 的安装路径和后面的代理自己看着填，不要用相对路径。
参数中 `-S` 指是 socks 代理，默认是 socks5。如果要使用 HTTP 代理，就写 `-H`。
