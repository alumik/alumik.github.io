---
title: List All CRON Jobs for All Users
date: 2021-11-11 15:46:01
categories: Linux 系统和软件
tags: cron
abbrlink: 76
references:
  - https://stackoverflow.com/questions/134906/how-do-i-list-all-cron-jobs-for-all-users
---
You would have to run this as root (hence the `sudo`):

```sh
for user in $(cut -f1 -d: /etc/passwd); do echo $user; sudo crontab -u $user -l; done
```

will loop over each user name listing out their crontab.
The crontabs are owned by the respective users so you won't be able to see another user's crontab w/o being them or root.
