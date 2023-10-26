---
title: Style LaTeX Code in lstlisting
date: 2022-10-25 20:14:39
categories: LaTeX
tags: listings
abbrlink: 115
references:
  - https://tex.stackexchange.com/questions/637284/want-to-style-latex-code-in-my-lstlistings
---
Try this:

{% code lang:latex %}
\documentclass{article}
\usepackage[T1]{fontenc}
\usepackage{listings,xcolor}

\lstdefinestyle{mystyle}
{
  language=[LaTeX]{TeX},
  texcsstyle=*\color{blue},
  basicstyle=\ttfamily,
  moretexcs={mycommand}, % user command highlight
  frame=single,
}
\begin{document}

\begin{lstlisting}[style=mystyle]
\documentclass{article}
\usepackage[T1]{fontenc}
\newcommand*{\mycommand}{Hello World!}
\begin{document}
  \mycommand
\end{document}
\end{lstlisting}

\end{document}
{% endcode %}
