---
title: Put a Reference for a Graphic in Beamer
date: 2021-04-19 20:42:05
categories: LaTeX
tags: Beamer
abbrlink: 62
references:
  - https://tex.stackexchange.com/questions/262259/how-to-put-a-reference-for-a-graphic-in-beamer
---
Try to put reference immediately below picture like this:

```tex
\begin{frame}
  \includegraphics[width=\linewidth]{example-image}\\[-1ex]
  {\tiny Source: \cite{foo12}}
\end{frame}
```
