---
title: Print Total Memory Used by a Python Process
date: 2021-12-29 16:56:09
categories: Python
tags:
abbrlink: 79
references:
  - https://stackoverflow.com/questions/938733/total-memory-used-by-python-process
---
Here is a useful solution that works for various operating systems, including Linux, Windows, etc.:

{% code lang:python %}
import psutil
process = psutil.Process()
print(process.memory_info().rss)  # in bytes
{% endcode %}
