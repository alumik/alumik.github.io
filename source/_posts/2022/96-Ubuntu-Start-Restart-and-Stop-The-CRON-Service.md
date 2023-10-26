---
title: Ubuntu Start Restart and Stop The CRON Service
date: 2022-08-09 17:59:45
categories: Linux 系统和软件
tags:
  - Ubuntu
  - cron
abbrlink: 96
references:
  - https://www.cyberciti.biz/faq/howto-linux-unix-start-restart-cron/
---
## Start Cron Service

To start the cron service, use:

{% code %}
sudo /etc/init.d/cron start
{% endcode %}

OR

{% code %}
sudo service cron start
{% endcode %}

## Stop Cron Service

To stop the cron service, use:


{% code %}
sudo /etc/init.d/cron stop
{% endcode %}

OR

{% code %}
sudo service cron stop
{% endcode %}

## Restart Cron Service

To restart the cron service, use:

{% code %}
sudo /etc/init.d/cron restart
{% endcode %}

OR

{% code %}
sudo service cron restart
{% endcode %}
