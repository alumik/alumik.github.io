---
title: 开启 MySQL 远程访问权限
categories: 数据库管理系统
tags: MySQL/MariaDB
abbrlink: 34707
date: 2019-06-24 15:28:12
updated: 2020-02-21 14:15:04
---
## 新增用户并授权

使用 root 用户执行：

```sql
CREATE USER 'your_username'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON `your_schema_name`.`your_table_name` TO 'your_username'@'%';
FLUSH PRIVILEGES;
```

## 允许所有地址访问

注释掉 */etc/mysql/mysql.conf.d/mysqld.cnf* （或类似文件）中的 `bind-address = 127.0.0.1` 。

重启 MySQL：

```bash
service mysql restart
```
