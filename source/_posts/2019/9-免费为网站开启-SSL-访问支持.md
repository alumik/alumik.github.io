---
title: 免费为网站开启 SSL 访问支持
categories: 网络服务
tags: SSL
abbrlink: 9
date: 2019-06-24 15:30:53
---
## 系统环境

本教程基于以下系统环境写作：

- Ubuntu 18.04
- Apache2 2.4.29

## 申请免费证书

SSL 免费证书申请地址为 [SSL for Free](https://www.sslforfree.com/) 。

按照网站指示申请证书。

{% note warning %}
对于各级次级域名，如 `*.example.com` 或 `*.example.example.com` 均需要单独申请证书。
{% endnote %}

<!-- more -->

## 安装证书

开启 Apache2 的 SSL 模块：

{% code lang:bash %}
a2enmod ssl
{% endcode %}

下载下来的证书分为三个文件。建议将文件重命名并放置到：

{% code lang:bash %}
/etc/ssl/example_com.crt            # 原名certificate.crt
/etc/ssl/example_com_ca_bundle.crt  # 原名ca_bundle.crt
/etc/ssl/private/example_com.key    # 原名private.key
{% endcode %}

在 */etc/apache2/sites-available* 中，新建一份你要开启 https 访问的网站的配置文件的拷贝，如 *000-default-ssl.conf* 。根据实际情况，修改配置文件为如下形式：

{% code lang:apache %}
<VirtualHost *:443>
    ServerName example.com
    DocumentRoot /var/www/

    SSLEngine on
    SSLCertificateFile /etc/ssl/example_com.crt
    SSLCertificateKeyFile /etc/ssl/private/example_com.key
    SSLCertificateChainFile /etc/ssl/private/example_com.key
</VirtualHost>
{% endcode %}

启用新的配置文件：

{% code lang:bash %}
a2ensite 000-default-ssl.conf
{% endcode %}

重启 Apache2 服务：

{% code lang:bash %}
service apache2 restart
{% endcode %}

## 配置自动跳转

开启 Apache2 的 rewrite 模块

{% code lang:bash %}
a2enmod rewrite
{% endcode %}

在 HTTP 访问的配置文件中（如 *000-default.conf* ），在 `<VirtualHost *:80></VirtualHost>` 标签内随便一个地方加入以下三行：

{% code lang:apache %}
RewriteEngine on
RewriteCond %{HTTPS} !=on
RewriteRule ^(.*) https://%{SERVER_NAME}$1 [L,R=301]
{% endcode %}

重启 Apache2 服务：

{% code lang:bash %}
service apache2 restart
{% endcode %}

至此，SSL 访问全部配置完成。
