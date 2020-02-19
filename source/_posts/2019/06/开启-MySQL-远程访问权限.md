---
title: 开启 MySQL 远程访问权限
date: 2019-06-24 15:28:12
categories:
- 数据库
- MySQL/MariaDB
tags:
---
## 授予权限

使用 root 用户操作，将 `password` 修改为你想设置的密码。

```sql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password';
```

## 允许所有地址访问

注释掉 */etc/mysql/mysql.conf.d/mysqld.cnf* （或类似文件）中的 `#bind-address = 127.0.0.1` 。

重启 MySQL

```bash
service mysql restart
```
