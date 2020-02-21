---
title: 取消 MySQL/MariaDB root 用户免密码登录功能
date: 2019-06-24 16:45:56
updated: 2020-02-21 15:03:37
categories: 过期或不适用的文章
tags:
---
{% note danger %}
该文章内容已过期或不再适用。
{% endnote %}

{% note warning %}
尽量不要使用数据库 root 用户。建议为每个数据库应用建立单独的用户。
{% endnote %}

在使用 MySQL/MariaDB 时，如果使用的是系统 root 用户，可以直接在控制台中输入

```
mysql
```

免密码使用数据库 root 用户登录数据库。

## 原因

在 `user` 表中有一列叫做 `plugin` ：

```sql
select user, authentication_string, plugin from user;
```

```
+------+-----------------------+-------------+
| user | authentication_string | plugin      |
+------+-----------------------+-------------+
| root | *                     | auth_socket |
+------+-----------------------+-------------+
1 rows in set (0.00 sec)
```

其中的 `auth_socket` 让你能方便地作为 root 用户从控制台免密码登录。但这同时也禁用了密码登录，而且你不能使用其它客户端进行登录。

<!-- more -->

## 解决办法

如果必须要使用数据库 root 用户，则需要做如下修改。注意按照自己的数据库版本选择合适的命令。

### MySQL

#### 5.7

```sql
alter user 'root'@'localhost' identified by 'YOUR PASSWORD HERE';
update mysql.user set plugin = 'mysql_native_password' where user = 'root' and host = 'localhost';
flush privileges;
```

#### 8.0

待补充。

### MariaDB

#### <10.2

```sql
set password for 'root'@'localhost' = password('YOUR PASSWORD HERE');
update mysql.user set plugin = '' where user = 'root' and host = 'localhost';
flush privileges;
```

#### ≥10.2

```sql
alter user 'root'@'localhost' identified by 'YOUR PASSWORD HERE';
update mysql.user set plugin = '' where user = 'root' and host = 'localhost';
flush privileges;
```

## 注意事项

如果你使用的是 Ubuntu 等 Debian 系系统，还需要打开 */etc/mysql/debian.cnf* 。如果其中的 `user` 字段是 `root` ，则需要将其中对应的 `password` 字段设置为你刚才设置的密码。 如果 `user` 字段不是 `root` ，则无需修改。
