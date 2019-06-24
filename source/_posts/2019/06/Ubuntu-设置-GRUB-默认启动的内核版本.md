---
title: Ubuntu 设置 GRUB 默认启动的内核版本
date: 2019-06-24 20:29:37
categories:
- Linux
- Ubuntu
tags:
---
要修改默认的启动内核，可以执行以下操作。

打开文件 */etc/default/grub* ，将 `GRUB_DEFAULT` 的值更改为您希望选择的菜单选项的索引值。

例如，在启动过程中的 GRUB 菜单中有

```
Ubuntu
Advanced options for Ubuntu
Windows 10 (loader) (on /dev/sda1)
system setup
```

其中 Advananced options for Ubuntu 子菜单如下所示

```
Ubuntu, with Linux 4.13.0-26-generic
Ubuntu, with Linux 4.13.0-26-generic (upstart)
Ubuntu, with Linux 4.13.0-26-generic (recovery mode)
Ubuntu, with Linux 4.10.0-42-generic
Ubuntu, with Linux 4.10.0-42-generic (upstart)
Ubuntu, with Linux 4.10.0-42-generic (recovery mode)
```

现在，第一个选项是索引 `0` ，第二个是 `1` ，第三个是 `2` ，依此类推。

例如现在想选择 Advanced options for Ubuntu 子菜单中的 Ubuntu, with Linux 4.10.0-42-generic ，则将 `GRUB_DEFAULT` 设为：

```
GRUB_DEFAULT = "1> 3"
```

使用 > 符号来指定子菜单（注意符号 `>` 和数字 `3` 之间有空格，所以需要双引号）。在这种情况下，主菜单中选择第二个选项（索引 1 ），在子菜单中选择第四个选项（索引 3 ）。

菜单选项来自文件 */boot/grub/grub.cfg* （不要编辑这个文件）。

一旦对 */etc/default/grub* 进行了更改，请保存并运行

```
update-grub
```

来更新 GRUB 配置文件（必须，否则不生效）。重新启动，现在应该默认启动旧的内核版本。
