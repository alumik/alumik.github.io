---
title: 使用 pandas 和 Matplotlib 绘制 CDF 图
date: 2020-02-19 17:52:45
categories:
- Python
- 科学计算工具
tags:
---
## 所使用的核心方法

根据 `pandas.Series.hist` 的文档可知，其可以帮助我们画出想要的 CDF 图。

<!-- more -->

```
Draw histogram of the input series using matplotlib.
Parameters
----------
by : object, optional
    If passed, then used to form histograms for separate groups.
ax : matplotlib axis object
    If not passed, uses gca().
grid : bool, default True
    Whether to show axis grid lines.
xlabelsize : int, default None
    If specified changes the x-axis label size.
xrot : float, default None
    Rotation of x axis labels.
ylabelsize : int, default None
    If specified changes the y-axis label size.
yrot : float, default None
    Rotation of y axis labels.
figsize : tuple, default None
    Figure size in inches by default.
bins : int or sequence, default 10
    Number of histogram bins to be used. If an integer is given, bins + 1
    bin edges are calculated and returned. If bins is a sequence, gives
    bin edges, including left edge of first bin and right edge of last
    bin. In this case, bins is returned unmodified.
backend : str, default None
    Backend to use instead of the backend specified in the option
    ``plotting.backend``. For instance, 'matplotlib'. Alternatively, to
    specify the ``plotting.backend`` for the whole session, set
    ``pd.options.plotting.backend``.
    .. versionadded:: 1.0.0
**kwargs
    To be passed to the actual plotting function.
Returns
-------
matplotlib.AxesSubplot
    A histogram plot.
See Also
--------
matplotlib.axes.Axes.hist : Plot a histogram using matplotlib.
```

## 测试数据

| Series A | Series B |
|----------|----------|
| 0.55     | 0.6      |
| 0.59     | 0.632    |
| 0.717    | 0.719    |
| 0.661    | 0.725    |
| 0.479    | 0.726    |
| 0.741    | 0.742    |
| 0.718    | 0.742    |
| 0.745    | 0.748    |
| 0.61     | 0.75     |
| 0.739    | 0.764    |
| 0.532    | 0.78     |
| 0.8      | 0.808    |
| 0.618    | 0.811    |
| 0.603    | 0.819    |
| 0.792    | 0.832    |
| 0.703    | 0.834    |
| 0.697    | 0.834    |
| 0.764    | 0.859    |
| 0.709    | 0.862    |
| 0.764    | 0.875    |
| 0.8      | 0.895    |
| 0.897    | 0.897    |
| 0.869    | 0.898    |
| 0.902    | 0.907    |
| 0.898    | 0.908    |
| 0.86     | 0.911    |
| 0.888    | 0.911    |
| 0.904    | 0.927    |
| 0.929    | 0.932    |
| 0.932    | 0.932    |
| 0.73     | 0.933    |
| 0.922    | 0.947    |
| 0.944    | 0.95     |
| 0.955    | 0.95     |
| 0.97     | 1        |

## 完整代码

```python
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('...', header=0)
legend = []

series: pd.Series
for index, series in df.iteritems():
    legend.append(index)
    bins = sorted(series.drop_duplicates()) + [2]  # 用于隐藏右侧的垂直竖线，数值根据实际情况调整
    series.hist(cumulative=True, histtype='step', density=1, bins=bins, linewidth=2)

plt.title('Empirical CDF')
plt.xlabel('Value')
plt.ylabel('Density')
plt.xlim((0, 1))
plt.ylim((0, 1))
plt.legend(legend, loc='upper left')
plt.show()
```

## 绘制结果

![Empirical CDF](cdf.png)
