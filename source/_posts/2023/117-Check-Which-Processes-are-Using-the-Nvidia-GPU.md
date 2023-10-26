---
title: Check Which Processes are Using the Nvidia GPU
date: 2023-03-03 03:09:53
categories: Linux 系统和软件
tags:
abbrlink: 117
references:
  - https://forums.developer.nvidia.com/t/11-gb-of-gpu-ram-used-and-no-process-listed-by-nvidia-smi/44459/3
  - https://stackoverflow.com/questions/71433347/no-such-process-consumes-gpu-memory
---
Apart from `nvidia-smi`, on Linux you can check which processes might be using the GPU using the command

{% code lang:sh %}
sudo fuser -v /dev/nvidia*
{% endcode %}

This will list processes that have NVIDIA GPU device nodes open.
