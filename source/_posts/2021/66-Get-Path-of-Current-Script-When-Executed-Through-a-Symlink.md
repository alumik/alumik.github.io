---
title: Get Path of Current Script When Executed Through a Symlink
date: 2021-05-15 16:32:25
categories: Linux 系统和软件
tags: Shell 脚本
abbrlink: 66
references:
  - https://unix.stackexchange.com/questions/17499/get-path-of-current-script-when-executed-through-a-symlink
---
Try this as a general purpose solution:

{% code lang:sh %}
DIR="$(cd "$(dirname "$0")" && pwd)"
{% endcode %}

In the specific case of following symlinks, you could also do this:

{% code lang:sh %}
DIR="$(dirname "$(readlink -f "$0")")"
{% endcode %}
