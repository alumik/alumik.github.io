---
title: 向 authorized_keys 文件中添加 SSH 密钥
date: 2021-12-22 16:08:06
categories: 其他软件问题
tags: SSH
abbrlink: 77
references:
  - https://askubuntu.com/questions/46424/how-do-i-add-ssh-keys-to-authorized-keys-file
---
如果您有基于登录的身份验证，则可以使用 `ssh-copy-id` 将您的公钥附加到远程服务器。 

```
ssh-copy-id user@host
```
