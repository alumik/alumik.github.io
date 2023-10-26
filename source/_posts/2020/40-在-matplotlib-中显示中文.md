---
title: 在 Matplotlib 中显示中文
categories: Python
tags: Matplotlib
abbrlink: 40
date: 2020-02-19 17:33:45
references:
  - https://blog.csdn.net/u010472607/article/details/82789887
---
{% note warning %}
本方法可能不适用于非 Windows 系统。
{% endnote %}

在 Python 中使用 Matplotlib 显示中文时，如果遇到字体显示不全等问题，可以添加如下代码片段解决。

{% code lang:python %}
# 用来正常显示中文汉字
plt.rcParams['font.sans-serif'] = ['SimHei']

# 用来正常显示负号
plt.rcParams['axes.unicode_minus'] = False
{% endcode %}
