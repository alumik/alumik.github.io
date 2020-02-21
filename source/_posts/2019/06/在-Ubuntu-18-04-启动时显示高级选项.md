---
title: 在 Ubuntu 18.04 启动时显示高级选项
categories: Linux
tags: Ubuntu
abbrlink: 27
date: 2019-06-24 20:23:20
---
在引导时按住 `Shift` 键即可进入高级选项菜单。如果想要每次都显示的话可以进行如下修改。

打开 */etc/default/grub* ，将 `GRUB_TIMEOUT` 设置为 `-1` 。

运行命令

```
update-grub
```

完成修改。
