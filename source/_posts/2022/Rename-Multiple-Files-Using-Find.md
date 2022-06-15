---
title: Rename Multiple Files Using Find
date: 2022-06-15 14:48:16
categories: Linux
tags: Shell 脚本
abbrlink: 91
references:
  - https://unix.stackexchange.com/questions/227662/how-to-rename-multiple-files-using-find
---
Use the following command to recursively rename files matching a specific pattern (`file*` here).

```
find . -type f -name 'file*' -execdir mv {} {}_renamed ';'
```
