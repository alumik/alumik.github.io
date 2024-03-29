---
title: Python 对齐中文输出
categories: Python
abbrlink: 22
date: 2019-06-24 17:04:49
tags:
---
## 问题

### 源代码

采用居中对齐，如左图

{% code lang:python %}
print('{:^9}\t'.format(string_var), end = '')
{% endcode %}

采用左对齐，如右图

{% code lang:python %}
print('{:<9}\t'.format(string_var), end = '')
{% endcode %}

### 运行结果

{% asset_img python-aligin-01.png 运行结果 %}

未能正确对齐。

<!-- more -->

## 原因

因为我们的输出结果中有中文，当我们输出的中文宽度不够约定的宽度时，系统会自动进行填充。而问题恰恰出现在填充这里，系统填充的是英文字符，而我们输出占用的是中文字符的宽度。单位不一致，自然会显得很别扭。

## 解决方案

替换填充字符为 `chr(12288)` 即中文空格。

`format` 方法补充说明如下：

| : | <填充> | <对齐> | <宽度> | , | .<精度> | <类型> |
| - | - | - | - | - | - | - |
| 引导符号 | 用于填充的单个字符 | `<` 左对齐， `>` 右对齐， `^` 居中对齐 | 输出宽度 | 数字的千位分隔符，适用于整数和浮点数 | 浮点数小数部分的精度或字符串的最大输出长度 | 整数类型 `b`, `c`, `d`, `o`, `x`, `X` ，浮点数类型 `e`, `E`, `f`, `%`

## 源代码

用 `chr(12288)` 填充，即这里的 `{1}` 。

居中对齐，如左图

{% code lang:python %}
print('{0:{1}^9}\t'.format(string_var, chr(12288)), end = '')
{% endcode %}

左对齐，如右图

{% code lang:python %}
print('{0:{1}<9}\t'.format(string_var, chr(12288)), end = '')
{% endcode %}

## 修改后

{% asset_img python-aligin-02.png 运行结果 %}

问题解决。
