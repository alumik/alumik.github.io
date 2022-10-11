---
title: >-
  解决使用并行框架时出现 WARNING: CMA surpport is not available due to restrictive ptrace
  settings
date: 2022-09-15 10:09:21
categories: Linux 系统和软件
tags:
abbrlink: 103
references:
  - https://blog.csdn.net/ou_no/article/details/118101402
---
使用 `root` 用户运行

```
echo 0 > /proc/sys/kernel/yama/ptrace_scope
```

要使得该修改在重启后不被覆盖

```
nano /etc/sysctl.d/10-ptrace.conf
```

修改使得 `kernel.yama.ptrace = 0`。
然后用 `sysctl -p /etc/sysctl.d/10-ptrace.conf` 执行生效。
