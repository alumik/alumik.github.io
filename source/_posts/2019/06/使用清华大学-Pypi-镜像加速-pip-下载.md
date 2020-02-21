---
title: 使用清华大学 PyPI 镜像加速 pip 下载
date: 2019-06-24 16:54:26
updated: 2020-02-21 15:14:22
categories: Python
tags: 
    - PyPI
    - 网络加速
---
PyPI 镜像每 5 分钟同步一次。

## 临时使用

```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

注意，simple 不能少, 是 https 而不是 http 。

## 设为默认

创建或修改：

- `~/.config/pip/pip.conf` (Linux)
- `%APPDATA%\pip\pip.ini` (Windows 10)
- `$HOME/Library/Application Support/pip/pip.conf` (macOS)

将 `index-url` 修改为 `https://pypi.tuna.tsinghua.edu.cn/simple` ，例如：

```
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```
