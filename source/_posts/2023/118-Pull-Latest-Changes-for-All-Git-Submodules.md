---
title: Pull Latest Changes for All Git Submodules
date: 2023-03-03 03:18:50
categories: 版本控制系统
tags: Git
abbrlink: 118
references:
  - https://stackoverflow.com/questions/1030169/pull-latest-changes-for-all-git-submodules
---
If it's the first time you check-out a repo you need to use `--init` first:

{% code lang:sh %}
git submodule update --init --recursive
{% endcode %}

For git 1.8.2 or above, the option `--remote` was added to support updating to latest tips of remote branches:

{% code lang:sh %}
git submodule update --recursive --remote
{% endcode %}

This has the added benefit of respecting any "non default" branches specified in the `.gitmodules` or `.git/config` files (if you happen to have any, default is `origin/master`, in which case some of the other answers here would work as well).
