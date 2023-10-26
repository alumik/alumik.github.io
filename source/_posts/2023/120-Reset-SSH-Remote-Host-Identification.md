---
title: Reset SSH Remote Host Identification
date: 2023-03-03 03:45:17
categories: Linux 系统和软件 
tags: SSH
abbrlink: 120
references:
  - https://stackoverflow.com/questions/20840012/ssh-remote-host-identification-has-changed
---
Here is the simplest solution:

{% code lang:sh %}
ssh-keygen -R <host>
{% endcode %}

For example,

{% code lang:sh %}
ssh-keygen -R 192.168.3.10
{% endcode %}

From the `ssh-keygen` man page:

> `-R hostname` Removes all keys belonging to hostname from a `known_hosts` file. This option is useful to delete hashed hosts (see the `-H` option above).
