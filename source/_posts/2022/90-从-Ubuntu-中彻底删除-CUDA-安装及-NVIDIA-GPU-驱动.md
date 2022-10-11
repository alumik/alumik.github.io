---
title: 从 Ubuntu 中彻底删除 CUDA 安装及 NVIDIA GPU 驱动
date: 2022-05-24 16:51:59
categories: Linux 系统和软件
tags:
  - Ubuntu
  - CUDA
abbrlink: 90
references:
  - https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#handle-uninstallation
  - https://forums.developer.nvidia.com/t/nvidia-smi-has-failed-because-it-couldnt-communicate-with-the-nvidia-driver-make-sure-that-the-latest-nvidia-driver-is-installed-and-running/197141
---
## 卸载通过 runfile 安装的程序和驱动

Use the following command to uninstall a Toolkit runfile installation:

```
sudo /usr/local/cuda-X.Y/bin/cuda-uninstaller
```

Use the following command to uninstall a Driver runfile installation:

```
sudo /usr/bin/nvidia-uninstall
```

## 卸载通过包管理器安装的程序和驱动

```
sudo apt-get remove --purge '^nvidia-.*'
sudo apt-get remove --purge '^libnvidia-.*'
sudo apt-get remove --purge '^cuda-.*'
```
