---
title: Make MySQL Table Name Case Insensitive
date: 2021-04-30 11:43:36
categories: 数据库管理系统
tags: MySQL/MariaDB
abbrlink: 64
references:
  - https://dba.stackexchange.com/questions/59407/how-to-make-mysql-table-name-case-insensitive-in-ubuntu
---
Open terminal and edit */etc/mysql/mysql.conf.d/mysqld.cnf*. Underneath the `[mysqld]` section, add:

{% code %}
lower_case_table_names = 1
{% endcode %}

Restart MySQL:

{% code %}
sudo service mysql restart
{% endcode %}

Then check it here:

{% code %}
mysqladmin -u root -p variables
{% endcode %}
