---
title: 解决 VMware 虚拟机共享文件夹的权限问题
date: 2019-06-24 20:27:02
categories:
- 虚拟机
- VMWare
tags:
---
在文件 */etc/fstab* 中加入新的一行

```
.host:/ /mnt/hgfs fuse.vmhgfs-fuse allow_other,defaults 0 0
```

即可。
