---
title: Set margin with enumitem
date: 2021-09-13 16:12:49
categories: LaTeX
tags:
abbrlink: 74
references:
  - https://tex.stackexchange.com/questions/269417/margin-problem-with-enumitem
---
Use `leftmargin=*`

```tex
\documentclass{article}
\usepackage{enumitem}
\usepackage{showframe}
\begin{document}
\begin{enumerate}[label=\bfseries Step \arabic*:,leftmargin=*]
  \item Elliptic Key Creation :
  \item Exchange of Public Elliptic keys
  \item MasterSecret Computation
\end{enumerate}
\end{document}
```

{% asset_img 1.png 520 %}

Or set a proper itemindent if you want to control the indent.

```tex
\documentclass{article}
\usepackage{enumitem}
\usepackage{showframe}
\begin{document}
\begin{enumerate}[label=\bfseries Step~\arabic*:,itemindent=3em]
  \item Elliptic Key Creation : 
  \item Exchange of Public Elliptic keys
  \item MasterSecret Computation
\end{enumerate}
\end{document}
```

{% asset_img 2.png 520 %}
