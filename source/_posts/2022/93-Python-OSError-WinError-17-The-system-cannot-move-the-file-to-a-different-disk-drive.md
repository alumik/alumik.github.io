---
title: >-
  Python - OSError: [WinError 17] The system cannot move the file to a different
  disk drive
date: 2022-07-30 17:31:39
categories: Python
tags:
abbrlink: 93
references:
  - https://stackoverflow.com/questions/21116510/python-oserror-winerror-17-the-system-cannot-move-the-file-to-a-different-d
---
When using `os.rename()` to try to move files between drives, you will receive this error:

{% code %}
OSError: [WinError 17] The system cannot move the file to a different disk drive
{% endcode %}

This is because `os.rename()` changes the path of the file but doesn't move its actual data on the disk. this is why you can't move (rename) it from one drive to another.

Moving between drives is actually copy it first, and then delete the source file. you can use `shutil.move()` method, which do it when you trying to transfer files between two drives.

{% code lang:python %}
import shutil

shutil.move(src, dest)
{% endcode %}
