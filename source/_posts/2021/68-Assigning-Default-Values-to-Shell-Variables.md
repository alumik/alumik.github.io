---
title: Assigning Default Values to Shell Variables
date: 2021-05-25 11:47:59
categories: Linux 系统和软件
tags: Shell 脚本
abbrlink: 68
references:
  - https://stackoverflow.com/questions/2013547/assigning-default-values-to-shell-variables-with-a-single-command-in-bash
---
You can use something called "bash parameter expansion" to accomplish this.

To get the assigned value, or default if it's missing:

```sh
# If variable not set or null, use default.
FOO="${VARIABLE:-default}"
```

Or to assign default to `VARIABLE` at the same time:

```sh
# If variable not set or null, set it to default.
FOO="${VARIABLE:=default}"
```
