---
title: 通过 ipmitool 找回遗忘的 iDRAC 地址
date: 2022-08-21 23:15:17
categories: Linux 系统和软件
tags: 
  - iDRAC
  - impitool
abbrlink: 98
references:
  - https://www.cnblogs.com/Vooom/p/4161703.html
---
在使用 Dell 服务器的过程中，如果可以进入系统，但是忘记 iDRAC 卡的地址，可以使用 ipmitool 这个工具来获取一下硬件信息，从而获得 iDRAC 地址。

IPMI（Intelligent Platform Management Interface）即智能平台管理接口,是使硬件管理具备“智能化”的新一代通用接口标准。
用户可以利用 IPMI 监视服务器的物理特征，如温度、电压、电扇工作状态、电源供应以及机箱入侵等。

安装 `impitool`：

{% code %}
sudo apt install impitool
{% endcode %}

配置启用：

{% code %}
sudo modprobe ipmi_msghandler
sudo modprobe ipmi_devintf
sudo modprobe ipmi_si
{% endcode %}

接着，使用如下命令查看 iDRAC 地址：

{% code %}
ipmitool lan print
{% endcode %}
