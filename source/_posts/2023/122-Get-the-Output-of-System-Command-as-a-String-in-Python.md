---
title: Get the Output of System Command as a String in Python
date: 2023-03-03 03:57:27
categories: Python
tags:
abbrlink: 122
references:
  - https://stackoverflow.com/questions/19243020/in-python-get-the-output-of-system-command-as-a-string
---
Use `os.popen()`:

```python
output = os.popen('ls').read()
```

The newer way (> Python 2.6) to do this is to use `subprocess`:

```python
output = subprocess.Popen('ls', stdout=subprocess.PIPE).stdout.read()
```
