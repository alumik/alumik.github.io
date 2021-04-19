---
title: Put a Reference for a Graphic in Beamer
date: 2021-04-19 20:42:05
categories: LaTeX
tags:
abbrlink: 62
---
Try to put reference immediately below picture like this:

```latex
\begin{frame}
    \includegraphics[width=\linewidth]{example-image}\\[-1ex]
    {\tiny Source: \cite{foo12}}
\end{frame}
```
