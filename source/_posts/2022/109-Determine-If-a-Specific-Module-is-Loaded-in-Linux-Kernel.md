---
title: Determine If a Specific Module is Loaded in Linux Kernel
date: 2022-10-09 19:26:25
categories: Linux
tags: modprobe
abbrlink: 109
references:
  - https://stackoverflow.com/questions/9845877/how-to-determine-if-a-specific-module-is-loaded-in-linux-kernel
---
The `--first-time` flag causes modprobe to fail if the module is already loaded.
That in conjunction with the `--dry-run` (or the shorthand `-n`) flag makes a nice test:

```
modprobe -n --first-time $MODULE && echo "Not loaded" || echo "Loaded"
```

This also prints `Loaded` if the module does not exist.
We can fix this by combining it with modinfo:

```
modinfo $MODULE >/dev/null 2>/dev/null &&
! modprobe -n --first-time $MODULE 2>/dev/null &&
echo "Loaded" || echo "Not loaded"
```
