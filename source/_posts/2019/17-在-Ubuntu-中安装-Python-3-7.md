---
title: 在 Ubuntu 中安装 Python 3.7
categories: 过期或不适用的文章
abbrlink: 17
date: 2019-06-24 16:36:24
tags:
---
{% note danger %}
该文章内容**已过期**或**不再适用**。

建议使用 [Conda](https://www.anaconda.com/) 安装任意版本的 Python。
{% endnote %}

## 系统准备

安装一些必要的依赖包

{% code %}
apt install libffi-dev libbz2-dev libssl-dev
apt install libreadline7 libreadline-dev libsqlite3-dev
apt install libncurses5 libncurses5-dev libncursesw5
apt install libgdbm-dev liblzma-dev uuid-dev zlib1g-dev
{% endcode %}

如果 lib 名称不确认的话，可以使用

{% code %}
apt-cache search
{% endcode %}

查找。

另外可能还需要安装 git, g++, make

{% code %}
apt install git g++ make
{% endcode %}

<!-- more -->

## 安装 pyenv

pyenv 是 shell 脚本编写的，只需要下载然后指定环境变量就可以了。

{% code %}
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL -l
{% endcode %}

## 安装 Python 3.7.0

{% code %}
pyenv install 3.7.0 -v
{% endcode %}

安装完成之后，需要使用如下命令对数据库进行更新

{% code %}
pyenv rehash
{% endcode %}

设置全局 Python 版本

{% code %}
pyenv global 3.7.0
{% endcode %}

此时便可以尝试输入

{% code %}
python --version
{% endcode %}

验证一下 Python 版本了。

## 后续配置

更新 pip

{% code %}
python -m pip install --upgrade pip
{% endcode %}

更新 setuptools

{% code %}
python -m pip install --upgrade setuptools
{% endcode %}

安装 ipython （可选）

{% code %}
pip install ipython
{% endcode %}
