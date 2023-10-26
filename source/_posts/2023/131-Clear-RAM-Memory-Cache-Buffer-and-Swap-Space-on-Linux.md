---
title: Clear RAM Memory Cache, Buffer and Swap Space on Linux
date: 2023-07-16 16:43:58
categories: Linux 系统和软件
tags:
abbrlink: 131
references:
  - https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/
---
Like any other operating system, GNU/Linux has implemented memory management efficiently and even more than that.
But if any process is eating away your memory and you want to clear it, Linux provides a way to flush or clear ram cache.

## How to Clear Cache in Linux?

Every Linux System has three options to clear cache without interrupting any processes or services.

As the `root` user:

1. Clear PageCache only.

{% code lang:sh %}
sync; echo 1 > /proc/sys/vm/drop_caches
{% endcode %}

2. Clear dentries and inodes.

{% code lang:sh %}
sync; echo 2 > /proc/sys/vm/drop_caches
{% endcode %}

3. Clear pagecache, dentries, and inodes.

{% code lang:sh %}
sync; echo 3 > /proc/sys/vm/drop_caches 
{% endcode %}

## Explanation of the above command

`sync` will flush the file system buffer.
Command Separated by `;` run sequentially.
The shell waits for each command to terminate before executing the next command in the sequence.
As mentioned in the kernel documentation, writing to `drop_cache` will clean cache without killing any application/service, command `echo` is doing the job of writing to file.

If you have to clear the disk cache, the first command is safest in enterprise and production as `...echo 1 >...` will clear the PageCache only.
It is not recommended to use the third option above `...echo 3 >...` in production until you know what you are doing, as it will clear pagecache, dentries, and inodes.

## How to Clear Swap Space in Linux?

If you want to clear Swap space, you may like to run the below command.

{% code lang:sh %}
swapoff -a && swapon -a
{% endcode %}
