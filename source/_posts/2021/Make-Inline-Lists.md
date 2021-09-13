---
title: Make inline lists
date: 2021-09-13 16:10:14
categories: LaTeX
tags:
abbrlink: 73
references:
  - https://tex.stackexchange.com/questions/146306/how-to-make-horizontal-lists/146312
---
The `enumitem` package has an `inline` option which implements inline versions of the standard lists using starred versions of the basic list environments. As with other `enumitem` lists, labels and (horizontal) spacing can be set with key values as well as custom settings for the elements between the list items (typically punctuation).

```tex
\documentclass{article}
\usepackage[inline]{enumitem}

\begin{document}

Text before list.
\begin{enumerate*}
  \item My first in list.
  \item My second in list.
\end{enumerate*}
Text after list.

\end{document}
```

{% asset_img 1.png 600 %}
