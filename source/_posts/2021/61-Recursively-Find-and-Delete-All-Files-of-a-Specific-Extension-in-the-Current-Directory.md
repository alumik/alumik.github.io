---
title: Recursively Find and Delete All Files of a Specific Extension in the Current Directory
date: 2021-04-19 20:37:07
categories: Linux 系统和软件
tags:
abbrlink: 61
references:
  - https://askubuntu.com/questions/377438/how-can-i-recursively-delete-all-files-of-a-specific-extension-in-the-current-di
  - https://devconnected.com/how-to-count-files-in-directory-on-linux/
---
Use `find`.

To see exactly which files you will remove:

{% code %}
find . -name "*.bak" -type f
{% endcode %}

To count the number of files:

{% code %}
find . -name "*.bak" -type f | wc -l
{% endcode %}

To delete these files:

{% code %}
find . -name "*.bak" -type f -delete
{% endcode %}

{% note danger %}
Make sure that `-delete` is the last argument in your command. If you put it before the `-name "*.bak"` argument, it will delete **everything**.
{% endnote %}
