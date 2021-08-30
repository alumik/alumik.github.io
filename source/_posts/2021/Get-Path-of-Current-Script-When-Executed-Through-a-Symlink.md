---
title: Get Path of Current Script When Executed Through a Symlink
date: 2021-05-15 16:32:25
categories: Linux
tags: Shell 脚本
abbrlink: 66
references:
  - https://unix.stackexchange.com/questions/17499/get-path-of-current-script-when-executed-through-a-symlink
---
Try this as a general purpose solution:

```sh
DIR="$(cd "$(dirname "$0")" && pwd)"
```

In the specific case of following symlinks, you could also do this:

```sh
DIR="$(dirname "$(readlink -f "$0")")"
```
