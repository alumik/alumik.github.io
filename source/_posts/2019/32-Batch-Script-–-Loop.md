---
title: Batch Script – Loop
categories: Windows 系统和软件
tags: 批处理文件
abbrlink: 32
date: 2019-06-24 20:50:19
---
`for /l` is your friend:

{% code lang:bat %}
for /l %x in (1, 1, 100) do echo %x
{% endcode %}

Starts at 1, steps by one, and finishes at 100.

Use two `%`s if it's in a batch file:

{% code lang:bat %}
for /l %%x in (1, 1, 100) do echo %%x
{% endcode %}

If you have multiple commands for each iteration of the loop, do this:

{% code lang:bat %}
for /l %x in (1, 1, 100) do (
   echo %x
   copy %x.txt z:\whatever\etc
)
{% endcode %}

or in a batch file:

{% code lang:bat %}
for /l %%x in (1, 1, 100) do (
   echo %%x
   copy %%x.txt z:\whatever\etc
)
{% endcode %}

Key:

+ `/l` denotes that the `for` command will operate in a numerical fashion, rather than operating on a set of files.
+ `%x` is the loops variable.
+ (starting value, increment of value, end condition\[inclusive\])
