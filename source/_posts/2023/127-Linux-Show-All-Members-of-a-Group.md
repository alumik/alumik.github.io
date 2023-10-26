---
title: Linux Show All Members of a Group
date: 2023-07-16 15:48:12
categories: Linux 系统和软件
tags:
abbrlink: 127
references:
  - https://www.cyberciti.biz/faq/linux-list-all-members-of-a-group/
---
## Display members of a group using `/etc/group` file

Use the `grep` command as follows (we are looking group named "ftponly"):

{% code lang:sh %}
grep ftponly /etc/group
{% endcode %}

To get just a list of all members of a group called "ftponly", type the following `awk` command:

{% code lang:sh %}
awk -F':' '/ftponly/{print $4}' /etc/group
{% endcode %}

## Display group memberships for each Linux user

Want to see group memberships for each given USERNAME under Linux? The syntax is as follows for the `groups` command:

{% code lang:sh %}
groups your-user-name-here
{% endcode %}
