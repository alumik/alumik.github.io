---
title: Reset Ubuntu Package to Automatic
date: 2022-10-09 18:25:51
categories: Linux 系统和软件
tags:
  - Ubuntu
  - apt
abbrlink: 108
references:
  - https://itsfoss.com/package-set-manually-installed/
---
If the state of the package got changed to manual from automatic, you can set it back to automatic in the following manner:

```
sudo apt-mark auto package_name
```
