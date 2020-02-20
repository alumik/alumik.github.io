---
title: 使用 Matplotlib 在一张图里画多条曲线
date: 2020-02-20 13:03:12
updated: 2020-02-21 03:33:00
categories: Python
tags: Matplotlib
---
## 前言

Python 中 Matplotlib 的作图功能很强大。本文教你将多条数据曲线画到一起，并且用不同颜色标志每条数据曲线。

{% note info %}
如果你对 Matplotlib 的使用不太熟悉，可以参考[此教程](https://matplotlib.org/tutorials/introductory/pyplot.html)。
{% endnote %}

## 将所有曲线画进一个子图

利用 Matplotlib 的默认方式来执行此操作。

例如：

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(10)
plt.plot(x, x)
plt.plot(x, 2 * x)
plt.plot(x, 3 * x)
plt.plot(x, 4 * x)
plt.show()
```
<!-- more -->

{% asset_img myplot-1.png %}

而且，正如你可能已经知道的那样，你可以轻松添加图例：

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(10)
plt.plot(x, x)
plt.plot(x, 2 * x)
plt.plot(x, 3 * x)
plt.plot(x, 4 * x)
plt.legend(['$y = x$', '$y = 2x$', '$y = 3x$', '$y = 4x$'], loc='upper left')
plt.show()
```

{% asset_img myplot-2.png %}

你还可以控制循环的颜色：

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(10)
plt.gca().set_prop_cycle(color=['red', 'green', 'blue', 'yellow'])
plt.plot(x, x)
plt.plot(x, 2 * x)
plt.plot(x, 3 * x)
plt.plot(x, 4 * x)
plt.legend(['$y = x$', '$y = 2x$', '$y = 3x$', '$y = 4x$'], loc='upper left')
plt.show()
```

{% asset_img myplot-3.png %}

但是，如果你想要在一个图上绘制很多曲线（>5），请做到：

1. 将它们放在不同的图上（考虑在一个图上使用一些子图），或
2. 使用颜色以外的其他东西（即标记样式或线条粗细）来区分它们。

否则，你将陷入一个非常混乱的境地！许多人在不同程度上都是色盲，区分众多微妙不同的颜色对于更多的人来说比你意识到的要困难。如果你真的想在一张图上放 20 条线，并且有 20 种相对不同的颜色，可以用如下方法：

```python
import matplotlib.pyplot as plt
import numpy as np

num_plots = 20

# Have a look at the colormaps here and decide which one you'd like:
# https://matplotlib.org/3.1.3/gallery/color/colormap_reference.html#sphx-glr-gallery-color-colormap-reference-py
plt.gca().set_prop_cycle(
    plt.cycler('color', plt.cm.get_cmap('gist_ncar')(np.linspace(0, 1, num_plots))))

# Plot several different functions...
x = np.arange(10)
for i in range(1, num_plots + 1):
    plt.plot(x, i * x + 5 * i, label=f'$y = {i}x + {5 * i}$')

# I'm basically just demonstrating several different legend options here...
plt.legend(ncol=4, loc='upper center',
           bbox_to_anchor=[0.5, 1.1],
           columnspacing=1.0, labelspacing=0.0,
           handletextpad=0.0, handlelength=1.5,
           fancybox=True, shadow=True)

plt.show()
```

{% asset_img myplot-4.png %}

如果你事先不知道要绘制的线条数量，可以在绘制它们之后从图形中获取曲线数量并更改颜色：

```python
import matplotlib.pyplot as plt
import numpy as np

for i in range(1, 10):
    plt.plot(np.array([1, 5]) * i, label=f'$y = {4 * i}x + {i}$')

colormap = plt.cm.get_cmap('gist_ncar')
colors = [colormap(i) for i in np.linspace(0, 1, len(plt.gca().lines))]
for i, j in enumerate(plt.gca().lines):
    j.set_color(colors[i])

plt.legend(loc='upper left')
plt.show()
```

{% asset_img myplot-5.png %}

## 将曲线画进不同的子图

Matplotlib 中的每个子图，即 `axes` ，都有自己独立的颜色循环，即 `prop_cycle` ，如下：

```python
import matplotlib.pyplot as plt

fig, axes = plt.subplots(2, 3)
for ax in axes.flatten():
    ax.plot((0, 1), (0, 1))
plt.show()
```

{% asset_img myplot-6.png %}

那么该如何让所有子图中的曲线都拥有不同的颜色呢？

如果这些字图是由一个循环自动产生的（通常是这样），我们必须使用另一个循环变量去自动覆盖默认颜色设置：

```python
import matplotlib.pyplot as plt

fig, axes = plt.subplots(2, 3)
for ax, short_color_name in zip(axes.flatten(), 'brgkyc'):
    ax.plot((0, 1), (0, 1), short_color_name)
plt.show()
```

{% asset_img myplot-7.png %}

另一种方法是创建一个属性循环对象：

```python
import matplotlib.pyplot as plt

from cycler import cycler

fig, axes = plt.subplots(2, 3)
my_cycler = cycler('color', ['k', 'r']) * cycler('linewidth', [1., 1.5, 2.])
actual_cycler = my_cycler()

for ax in axes.flat:
    ax.plot((0, 1), (0, 1), **next(actual_cycler))
plt.show()
```

{% asset_img myplot-8.png %}

{% note warning %}
### 注意
`type(my_cycler)` 为 `cycler.Cycler` 但 `type(actual_cycler)` 为 `itertools.cycle` 。
{% endnote %}

---

**参考链接**

- https://stackoverflow.com/questions/4805048/how-to-get-different-colored-lines-for-different-plots-in-a-single-figure
