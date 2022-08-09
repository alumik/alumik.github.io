---
title: Linux：无法删除文件，不允许的操作
date: 2022-08-09 18:06:49
categories: Linux
tags: chattr
abbrlink: 97
references:
  - https://blog.csdn.net/qq_41538097/article/details/107653682
---
## 解决办法

使用 `chattr` 删除 `ia` 参数：

```
chattr -ia files...
```

## chattr 命令

`chattr` 命令用于改变文件属性，这些属性共有以下8种模式：

- `a` 让文件或目录仅供附加用途。
- `b` 不更新文件或目录的最后存取时间。
- `c` 将文件或目录压缩后存放。
- `d` 将文件或目录排除在倾倒操作之外。
- `i` 不得任意更动文件或目录。
- `s` 保密性删除文件或目录。
- `S` 即时更新文件或目录。
- `u` 预防意外删除。

{% note info %}
注意：文件属性为 `a` 时，追加文件内容需要使用 `echo` 命令，不能使用 `vim`。
原因是 `vim` 会生成新的文件，`echo` 是在源文件上追加。
{% endnote %}

### 语法

```
chattr [ -RVf ] [ -v version ] [ -p project ] [ mode ] files...
```

### 参数

- `-R` 递归处理，将指定目录下的所有文件及子目录一并处理。
- `-V` 显示指令执行过程。
- `-f` 忽略大多数错误信息。
- `-v version` 设置文件或目录版本。
- `-p project` 设置文件或目录项目编号。
- `+<mode>` 开启文件或目录的该项属性。
- `-<mode>` 关闭文件或目录的该项属性。
- `=<mode>` 指定文件或目录的该项属性。
