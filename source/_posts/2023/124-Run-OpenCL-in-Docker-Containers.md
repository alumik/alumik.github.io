---
title: Run OpenCL in Docker Containers
date: 2023-03-16 02:55:13
categories: 容器与虚拟机
tags:
  - Docker
  - OpenCL
abbrlink: 124
references:
  - https://linuxhandbook.com/setup-opencl-linux-docker/
---
After installing the NVIDIA container runtime, you should install all necessary packages:

{% code lang:sh %}
apt update
apt install ocl-icd-libopencl1 opencl-headers clinfo
{% endcode %}

Enable OpenCL by:

{% code lang:sh %}
mkdir -p /etc/OpenCL/vendors
echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
{% endcode %}
