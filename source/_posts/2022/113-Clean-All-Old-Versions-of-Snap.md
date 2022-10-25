---
title: Clean All Old Versions of Snap
date: 2022-10-25 20:04:58
categories: Linux 系统和软件
tags: snap
abbrlink: 113
references:
  - https://askubuntu.com/questions/1155957/two-different-versions-of-gnome-runtime
---
To clean all old versions of snaps, try:

```
LANG=C snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then sudo snap remove "$snapname" --revision="$rev"; fi; done
```
