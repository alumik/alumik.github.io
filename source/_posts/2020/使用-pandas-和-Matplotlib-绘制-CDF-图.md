---
title: 使用 pandas 和 Matplotlib 绘制 CDF 图
categories: Python
tags:
  - pandas
  - Matplotlib
abbrlink: 41
date: 2020-02-19 17:52:45
---
## 核心方法

`pandas.Series.hist` 和 `matplotlib.pyplot.hist` 可以帮助我们画出想要的 CDF 图。

{% asset_img cdf.png %}

<!-- more -->

## 参数说明

### bins

- int or sequence, default 10.
- Number of histogram bins to be used. If an integer is given, bins + 1 bin edges are calculated and returned. If bins is a sequence, gives bin edges, including left edge of first bin and right edge of last bin. In this case, bins is returned unmodified.

### density

- bool, default None.
- If True, the first element of the return tuple will be the counts normalized to form a probability density, i.e., the area (or integral) under the histogram will sum to 1. This is achieved by dividing the count by the number of observations times the bin width and not dividing by the total number of observations. If stacked is also True, the sum of the histograms is normalized to 1.

### cumulative

- bool, default False.
- If True, then a histogram is computed where each bin gives the counts in that bin plus all bins for smaller values. The last bin gives the total number of datapoints. If normed or density is also True then the histogram is normalized such that the last bin equals 1. If cumulative evaluates to less than 0 (e.g., -1), the direction of accumulation is reversed. In this case, if normed and/or density is also True, then the histogram is normalized such that the first bin equals 1.

### histtype

- {'bar', 'barstacked', 'step', 'stepfilled'}, default 'bar'.
- The type of histogram to draw:
    - 'bar' is a traditional bar-type histogram. If multiple data are given the bars are arranged side by side.
    - 'barstacked' is a bar-type histogram where multiple data are stacked on top of each other.
    - 'step' generates a lineplot that is by default unfilled.
    - 'stepfilled' generates a lineplot that is by default filled.

## 完整代码

```python
import pandas as pd
import matplotlib.pyplot as plt

from matplotlib.lines import Line2D

df = pd.read_csv('cdf.csv', header=0)
fig = plt.figure()
ax = fig.add_subplot()

series: pd.Series
for label, series in df.iteritems():
    # 用于隐藏最右边的竖线
    # 将 2 修改为横轴范围外的一处即可（但不可为 inf ）
    bins = sorted(series.drop_duplicates()) + [2]
    series.hist(label=label, cumulative=True, histtype='step',
                density=1, bins=bins, linewidth=2)

ax.set_title('Empirical CDF')
ax.set_xlabel('Value')
ax.set_ylabel('Density')
ax.set_xlim((0, 1))
ax.set_ylim((0, 1))

handles, labels = ax.get_legend_handles_labels()
new_handles = [Line2D([], [], c=h.get_edgecolor()) for h in handles]
ax.legend(handles=new_handles, labels=labels)

fig.show()
```

## 附：测试数据

```
Series A,Series B
0.55,0.6
0.59,0.632
0.717,0.719
0.661,0.725
0.479,0.726
0.741,0.742
0.718,0.742
0.745,0.748
0.61,0.75
0.739,0.764
0.532,0.78
0.8,0.808
0.618,0.811
0.603,0.819
0.792,0.832
0.703,0.834
0.697,0.834
0.764,0.859
0.709,0.862
0.764,0.875
0.8,0.895
0.897,0.897
0.869,0.898
0.902,0.907
0.898,0.908
0.86,0.911
0.888,0.911
0.904,0.927
0.929,0.932
0.932,0.932
0.73,0.933
0.922,0.947
0.944,0.95
0.955,0.95
0.97,1
```
