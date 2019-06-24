---
title: 为 IIS 配置 PHP 支持
date: 2019-06-24 11:25:57
categories:
- PHP
- [HTTP 服务器, IIS]
tags:
---
下载 php 并解压。

[官方下载地址](http://windows.php.net/download/)

进入“控制面板 >> 管理工具 >> Internet信息服务(IIS)管理器”。中间窗口选择“处理程序映射”双击，然后最右边选择“添加模块映射”，按图中步骤填写相关信息。

{% asset_img 01.jpg %}

{% asset_img 02.jpg %}

“可执行文件”一栏找到 php 的安装目录，右下角的文件类型改为 `exe` 即可看到 *php-cgi.exe* 文件出现了。

{% asset_img 03.jpg %}

{% asset_img 04.jpg %}

{% asset_img 05.jpg %}

{% asset_img 06.jpg %}

然后可以给网站添加默认文档 *default.php* 和 *index.php* 。

{% asset_img 07.jpg %}

进入 php 安装目录，重命名 *php.ini-development* 为 *php.ini* 。

{% asset_img 08.jpg %}

打开 *php.ini* ，将 `date.timezone` 修改为 `date.timezone="Asia/Shanghai"` （即修改当前的时区）。

接着激活需要的扩展选项，即将相应语句前的分号删除，例如

```
extension=mysqli
extension=pdo_mysql
extension=gd2
```

再将 `; extension_dir = "ext"` 前的分号去掉，保存。

php 环境配置好了，我们就可以测试一下了。在建立的网站目录下新建一个 *index.php* 文件

```php
<?php phpinfo(); ?>
```

然后再在浏览器中打开该网页，即可出现类似如下界面。

{% asset_img 09.jpg %}

注：在命令行中进入 php 安装目录下，输入 `php -m` 命令可查看已开启的扩展模块。

{% asset_img 10.jpg %}
