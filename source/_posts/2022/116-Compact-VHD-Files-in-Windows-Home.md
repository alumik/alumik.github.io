---
title: Compact VHD Files in Windows Home
date: 2022-10-25 20:16:23
categories: Windows 系统和软件
tags: diskpart
abbrlink: 116
references:
  - https://jaehoo.wordpress.com/2022/06/22/compact-vhd-file-in-windows-10-home/
---
I found a great tip in GitHub to compact a VHD file without Hyper-V tools and it works great.
The Dynamic VHD don't reduce their size even if the files were deleted from the hard drive, to fix it the "compact" operation is needed.
This is included into the Hyper-V tools but this is only available in Windows 10/11 Pro.

There are another way to do this in Windows 10/11 Home, using the next commands:

{% code %}
diskpart
 
# Open window Diskpart 
 
select vdisk file="C:\path\to\file.vhd"
attach vdisk readonly
compact vdisk
detach vdisk
exit
{% endcode %}
