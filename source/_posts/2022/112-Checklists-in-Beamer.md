---
title: Checklists in Beamer
date: 2022-10-11 09:41:03
categories: LaTeX
tags: Beamer
abbrlink: 112
references:
  - https://tex.stackexchange.com/questions/321048/checklist-in-beamer-using-enumitem-package
---
Some checkbox alternatives using `bbding`, `wasysym`, or nothing.

{% code lang:tex %}
\documentclass{beamer}

\usepackage{bbding}
\let\oldSquare\Square % \Square is also defined in wasysym
\usepackage{wasysym}

\begin{document}

\begin{frame}
    \begin{itemize}
        \item[$\boxtimes$] nothing
        \item[$\square$] nothing
            \bigskip
        \item[\fboxsep0pt\fbox{$\times$}] nothing
        \item[\fboxsep0pt\fbox{$\phantom{\times}$}] nothing
            \bigskip
        \item[\CheckedBox] \texttt{wasysym}
        \item[$\XBox$] \texttt{wasysym}
        \item[\Square] \texttt{wasysym} (\texttt{\textbackslash Square})
            \bigskip
        \item[\small\oldSquare] \texttt{bbding} (also \texttt{\textbackslash Square})
        \item[\small\rlap{\Checkmark}\oldSquare] \texttt{bbding}
        \item[\small\rlap{\XSolidBrush}\oldSquare] \texttt{bbding}
    \end{itemize}
\end{frame}

\end{document}
{% endcode %}

{% asset_img main.png %}
