---
title: 解决 VMware 虚拟机共享文件夹的权限问题
categories: 容器与虚拟机
tags: VMware Workstation Pro
abbrlink: 28
date: 2019-06-24 20:27:02
---
在文件 */etc/fstab* 中加入新的一行

{% code %}
.host:/ /mnt/hgfs fuse.vmhgfs-fuse allow_other,defaults 0 0
{% endcode %}

即可。
