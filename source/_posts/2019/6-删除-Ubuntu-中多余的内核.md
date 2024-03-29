---
title: 删除 Ubuntu 中多余的内核
categories: Linux 系统和软件
tags: Ubuntu
abbrlink: 6
date: 2019-06-24 15:24:31
---
Ubuntu 多次升级以后系统中会存在大量不同版本的内核，而每个内核占用非常多的硬盘空间，所以需要定期清理没用的内核，但最好保留最近两个内核，因为有的软件需要依赖特定内核而不一定是最新的。

首先查询当前我们使用的是内核是哪个版本的：

{% code lang:bash %}
uname -a
{% endcode %}

查询系统中装了哪些内核：

{% code lang:bash %}
dpkg --get-selections | grep linux
{% endcode %}
多余的内核可以通过命令删除：

{% code lang:bash %}
apt remove <内核文件名称>
{% endcode %}

执行完上面命令后接着执行以下命令查看内核是否都删除干净了：

{% code lang:bash %}
dpkg --get-selections | grep linux
{% endcode %}

如果没干净继续删除。有的内核后面会显示是 `deinstall` ，那需要通过：

{% code %}
dpkg --get-selections | grep deinstall | sed 's/deinstall/\lpurge/' | dpkg --set-selections; dpkg -Pa
{% endcode %}

进行删除。
