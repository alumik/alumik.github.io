---
title: 使用清华大学 PyPI 镜像加速 pip 下载
categories: Python
tags:
  - PyPI
  - 网络加速
abbrlink: 20
date: 2019-06-24 16:54:26
---
PyPI 镜像在每次同步成功后间隔 5 分钟同步一次。

## 临时使用

```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

注意，`simple` 不能少, 是 `https` 而不是 `http`。

## 设为默认

升级 pip 到最新的版本 (>=10.0.0) 后进行配置：

```
python -m pip install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

如果您到 pip 默认源的网络连接较差，临时使用镜像站来升级 pip：

```
python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
```
