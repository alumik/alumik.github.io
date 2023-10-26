---
title: 在 MySQL 中查询至今一天以上的数据
date: 2021-12-30 18:05:01
categories: 数据库管理系统
tags: MySQL
abbrlink: 80
references:
  - https://stackoverflow.com/questions/44155224/error-code-1292-truncated-incorrect-time-value
---
可以直接使用：

{% code lang:sql %}
SELECT * FROM data_table
    WHERE created_at < NOW() - INTERVAL 1 DAY;
{% endcode %}

下面是一个常见的错误写法：

{% code lang:sql %}
DELETE FROM data_table
    WHERE TIME_TO_SEC(TIMEDIFF(NOW(), created_at)) / 3600 >= 24
{% endcode %}

因为 `timediff()` 可接受参数的取值范围和 `time` 数据类型的范围一致，这样写可能会遇到 `Truncated incorrect time value` 错误。

> MySQL retrieves and displays TIME values in 'HH:MM:SS' format (or 'HHH:MM:SS' format for large hours values). TIME values may range from '-838:59:59' to '838:59:59'.
