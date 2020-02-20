---
title: 在 Matplotlib 中显示中文
date: 2020-02-19 17:33:45
categories: Python
tags: Matplotlib
---
在 Python 中使用 Matplotlib 显示中文时，会遇到一些问题，解决方案如下

```python
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文汉字
plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号
```

---

**参考链接**

- https://blog.csdn.net/u010472607/article/details/82789887
