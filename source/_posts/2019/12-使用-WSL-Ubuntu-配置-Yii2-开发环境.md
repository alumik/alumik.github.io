---
title: 使用 WSL (Ubuntu) 配置 Yii2 开发环境
categories: PHP
tags:
  - Yii2
  - WSL
abbrlink: 12
date: 2019-06-24 15:45:27
---
## 安装 WSL

首先在 “控制面板 -> 程序 -> 程序和功能 -> 启用或关闭 Windows 功能” 里开启“适用于 Linux 的 Windows 子系统”。

接着在 Microsoft Store 里安装 Ubuntu ，安装完成后打开 Ubuntu ，进行初始化配置，此时需要设置一个用户名和密码。

## 配置 WSL 环境

再次打开 Ubuntu ，将系统软件源切换为清华大学软件源（或者其他你偏好的软件源）。

删除原有软件源：

{% code %}
sudo rm /etc/apt/sources.list
{% endcode %}

添加新软件源：

{% code %}
sudo nano /etc/apt/sources.list
{% endcode %}

<!-- more -->

在打开的文本编辑器里键入以下内容：

{% code %}
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
{% endcode %}

编辑完成后，使用 **Ctrl + O** 保存，再使用 **Ctrl + X** 退出。

接下来更新系统。注意此步可能需要较长时间。

{% code %}
sudo apt update
sudo apt dist-upgrade
{% endcode %}

## 安装必要软件

首先安装 Apache2 网络服务器：

{% code %}
sudo apt install apache2
{% endcode %}

接下来安装 MariaDB 服务端和客户端：

{% code %}
sudo apt install mariadb-server mariadb-client
{% endcode %}

接下来安装 PHP 和相关组件：

{% code %}
sudo apt install php php-mysql php-zip php-xml php-mbstring
{% endcode %}

## 放置并链接项目文件

将项目文件放置到你想要的位置，如 *X:\example* ，并建立 Ubuntu 与 Windows 文件的软链接。

例如，将 Windows 中的 *X:\example* 链接到 Ubuntu 中的 */var/www/example* ：

{% code %}
ln -s /mnt/x/example /var/www/example
{% endcode %}

## 配置项目环境

切换到项目网站根目录，这里是 */var/www/example* ：

{% code %}
cd /var/www/example
{% endcode %}

安装 composer ：

{% code %}
sudo apt install composer
{% endcode %}

安装 Yii2 框架文件：

{% code %}
composer install
{% endcode %}

## 配置网络服务器环境

在 Apache2 虚拟主机配置文件里配置好网站的虚拟主机。下面是一段示例。

创建虚拟主机配置文件，注意文件名不要与已有的配置文件冲突：

{% code %}
sudo nano /etc/apache2/sites-available/001-example.conf
{% endcode %}

编辑文件：

{% code lang:apache %}
<VirtualHost *:80>
    ServerName example.com
    DocumentRoot /var/www/example
</VirtualHost>
{% endcode %}

启用新建的配置文件：

{% code %}
sudo a2ensite 001-example.conf
{% endcode %}

如果 Apache2 服务器未启动，启动 Apache2 服务器：

{% code %}
sudo service apache2 start
{% endcode %}

如果 Apache2 服务器已启动，重启 Apache2 服务器：

{% code %}
sudo service apache2 restart
{% endcode %}

## 解决权限问题

在 Ubuntu 中执行以下指令，注意替换 `x` 和 `X` 为你想要的盘符：

{% code %}
sudo umount /mnt/x
sudo mount -t drvfs X: /mnt/x -o metadata
{% endcode %}

现在可以尝试在浏览器中打开网站了。

## 其他问题

如果发现网页中时间显示不正确，可能是 PHP 时区错误的问题。在 *php.ini* 中修改或添加：

{% code %}
data.timezone = "Asia/Shanghai";
{% endcode %}

即可解决问题。
