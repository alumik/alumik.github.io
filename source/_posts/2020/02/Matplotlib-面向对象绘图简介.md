---
title: Matplotlib 面向对象绘图简介
date: 2020-02-20 23:58:48
updated: 2020-02-21 02:54:00
categories: Python
tags: Matplotlib
---
## 前言

在 Matplotlib 中一般有三种绘图方式： pyplot 、 pylab 和面向对象。在 Matplotlib 中还是推荐使用面向对象的方法，因为它可以更好地控制和自定义绘图。

官方教程中说：

{% note info %}
The pyplot API is generally less-flexible than the object-oriented API. Most of the function calls you see here can also be called as methods from an Axes object. We recommend browsing the tutorials and examples to see how this works.
{% endnote %}

下图显示了大部分绘图元素：

{% asset_img anatomy-of-a-figure.webp Anatomy of a Figure %}

<!-- more -->

## 三种绘图方式的联系与区别

`matplotlib` 是整个包， `matplotlib.pyplot` 是 Matplotlib 中的一个模块， `pylab` 是一个与 Matplotlib 一起安装的模块。

### matplotlib.pyplot

`matplotlib.pyplot` 为底层面向对象的绘图库提供状态机接口。状态机隐式地自动创建图形和轴，以实现所需的功能，例如：

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2, 100)

plt.plot(x, x, label='linear')
plt.plot(x, x ** 2, label='quadratic')
plt.plot(x, x ** 3, label='cubic')

plt.xlabel('x label')
plt.ylabel('y label')
plt.title("Simple Plot")
plt.legend()

plt.show()
```

{% asset_img myplot-1.png %}

第一次调用 `plt.plot` 将自动创建必要的图形和轴以实现所需的绘图。随后对 `plt.plot` 的调用会重新使用当前轴。设置标题，图例和轴标签还会自动使用当前轴并设置标题，创建图例并分别标记轴。`matplotlib.pyplot` 接口简单易用，交互使用时方便，可以根据命令实时作图，但底层定制能力不足。

### pylab

`pylab` 是一个便利模块，相当于在单个名称空间中批量导入 `matplotlib.pyplot` （用于绘图）和 `numpy` （用于数学和使用数组）。不过由于命名空间污染而强烈建议不要使用它。

```python
from pylab import *

x = linspace(0, 2, 100)

plot(x, x, label='linear')
plot(x, x ** 2, label='quadratic')
plot(x, x ** 3, label='cubic')

xlabel('x label')
ylabel('y label')
title("Simple Plot")
legend()

show()
```

### 面向对象

面向对象的绘图方式，接近 Matplotlib 基础和底层，难度稍大，但定制能力强，而且是 Matplotlib 的精髓。

## Matplotlib 中的面向对象

Matplotlib 中大的对象主要分为三个， `FigureCanvas` （画布、画布层）， `Figure` （图、图像层）和 `Axes` （坐标轴、绘制的区域、坐标层）。而 `FigureCanvas` 涉及到底层操作，暂时不必深究。

使用 Matplotlib 绘图需要搞清楚图和坐标轴两个对象。只有真正了解这两个概念，才能获得对整个绘图过程的控制权。

### Figure 对象与 Axes 对象

使用 `plt.figure` 创建一个空的 `Figure` 对象，通过 `plt.show` 显示出来：

```python
import matplotlib.pyplot as plt

plt.figure()
plt.show()
```

{% asset_img myplot-2.png %}

有了图像层，接下来就在图像层上绘图。我们首先需要创建一个坐标轴，可以调用 `Figure` 实例的 `add_axes` 方法：

```python
import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.add_axes([0.1, 0.1, 0.8, 0.8])  # [距离左边，下边，坐标轴宽度，坐标轴高度] 范围(0, 1)
fig.show()
```

`[0.1, 0.1, 0.8, 0.8]` 表示的是在图像层中，坐标轴区域距离画布左边 0.1 倍的位置，距离下边 0.1 倍的位置，确定了这两个位置后，坐标轴的整体宽度和高度占 0.8 倍的大小。得到如下结果：

{% asset_img myplot-3.png %}

### 创建对象

如果你之前就接触过一些绘图的命令，你会发现：

```python
import matplotlib.pyplot as plt

plt.plot([0, 1, 2])
plt.show()
```

直接使用这两个命令就能绘图，并没有定义画布和坐标轴。得到如下图：

{% asset_img myplot-4.png %}

这是因为 Matplotlib 会在最近用过的坐标层上进行绘图，如果没有的话，会自动创建一个图对象和坐标轴。但是显式地创建图对象和坐标轴能让我们对绘图过程有完全的控制权（比如可以指定在什么地方绘图），而且绘图的逻辑性更强。接下来我们绘制一张图中图来理解这个过程：

```python
import numpy as np
import matplotlib.pyplot  as plt

x = np.linspace(0, 10, 10)
y = np.sin(x)

fig = plt.figure()
ax1 = fig.add_axes([0.1, 0.1, 0.8, 0.8])  # 第一个坐标轴的范围
ax2 = fig.add_axes([0.2, 0.5, 0.4, 0.3])  # 第二个坐标轴的范围
ax1.plot(x, y, 'r')
ax2.plot(x, y, 'g')

fig.show()
```

我们得到了如下图像：

{% asset_img myplot-5.png %}

这里我们创建了两个坐标轴 `ax1` 和 `ax2` ，分别对两个坐标层指定范围并作图。

### 创建子图

子图是自带坐标轴的。下面在绘图层上创建两个子图（一行两列）：

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(1, 100, 1)

fig = plt.figure()

ax1 = fig.add_subplot(121)
ax1.plot(x, x, label='linear')
ax1.grid(color='g', linestyle='--')
ax1.legend()

ax2 = fig.add_subplot(122)
ax2.plot(x, x ** 2, label='quadratic')

fig.show()
```

{% asset_img myplot-6.png %}

此处可以和 pyplot 绘图方式简单对比一下：

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(1, 100, 1)

plt.subplot(121)
plt.plot(x, x, label='linear')
plt.grid(color='g', linestyle='--')
plt.legend()

plt.subplot(122)
plt.plot(x, x ** 2, label='quadratic')

plt.show()
```

这里 `plt.subplot` 和 `fig.add_subplot` 稍有差别。若参数传入 `231` 和 `531` ，显然不匹配，若用 `plt.subplot` 则只会显示后者，若用 `fig.add_subplot` 则都会显示出来，但有可能会重叠，显然后者在上方。

使用 `plt.subplot` ：

{% asset_img myplot-7.png %}

使用 `fig.add_subplot` ：

{% asset_img myplot-8.png %}

### 设置图片尺寸大小

在创建 `Figure` 对象的时候，我们可以使用 `figsize` 和 `dpi` 控制图片尺寸。比如：

```python
fig = plt.figure(figsize=(16,8), dpi=100)
```

`figsize` 表示画布长宽大小，单位为英寸， `dpi` 表示每英寸的像素值。因此上面的命令就创建了一张 1600*800 像素的画布。

### 保存图片

从上面输出的结果来看， `plt.show` 仅仅是将图片显示了出来。如果要保存图片，还需要通过 `savefig` 保存。没有显式指定画布和坐标轴，直接使用 `plt.savefig` 保存也可以，若显式指明了图对象可以用 `Figure` 实例的方法 `fig.savefig` 。 Matplotlib 可以生成多种格式的高质量图像，包括 PNG ， JPG ， EPS ， SVG ， PGF 和 PDF ，只要写好后缀名即可：

```python
fig.savefig("result.png")
```
### 其他差别

下表展示了一些常用方法的对比：

| 面向对象方式 | `pyplot` 方式 |
| --------------- | ------------ |
| ax.set_title()  | plt.title()  |
| ax.set_xlabel() | plt.xlabel() |
| ax.set_ylabel() | plt.ylabel() |
| ax.set_xlim()   | plt.xlim()   |
| ax.set_ylim()   | plt.ylim()   |

## 小结

建议按照显式的方法去绘图：先创建画布，再创建坐标轴，最后在坐标轴上绘图。这种代码方式会让绘图逻辑更加清晰，能够随心所欲地修改图片的每个地方。

---

**参考链接**

- https://segmentfault.com/a/1190000020450334?utm_source=tag-newest
