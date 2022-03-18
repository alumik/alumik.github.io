---
title: Put 4 Authors in a Single Row in acmart LaTeX Template
date: 2022-03-18 15:52:29
categories: LaTeX
tags:
abbrlink: 81
references:
  - https://tex.stackexchange.com/questions/420200/how-to-put-4-authors-in-a-single-row-in-acm-conf-format
---
The class `acmart` allows to set the number of authors per row by inserting e.g.

```tex
\settopmatter{authorsperrow=4}
```

after `\documentclass{acmart}`.
