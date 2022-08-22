---
title: Prevent frame Option in includegraphics Making an Overfull hbox
date: 2021-07-01 16:28:51
categories: LaTeX
tags:
abbrlink: 69
references:
  - https://tex.stackexchange.com/questions/133450/frame-option-in-includegraphics-makes-an-overfull-hbox
---
Here's how you can do; which one to choose between the second and third example is a matter of taste and of what your pictures contain.

The `frame` option draws a frame with rule of width `\fboxrule` (by default) and zero space between the frame and the box. But the rule width is added to the width of the box, so you have to do something about it: either reduce a bit the width of the box, or draw the frame inside the box, by specifying a negative separation (second parameter to the `frame` option).

```tex
\documentclass{article}
\usepackage[export]{adjustbox}
\usepackage{graphicx}
\setlength{\parindent}{0pt} % just for the example

\begin{document}

\footnotesize

% first example: bad, there's an overfull of twice the rule width    
\verb|\includegraphics[width=\textwidth,frame]{tiger}|\\
\begin{minipage}{4cm}
\includegraphics[width=\textwidth,frame]{tiger}
\end{minipage}

\medskip

% second example: good, the frame is drawn outside the picture
\verb|\includegraphics[width=\dimexpr\textwidth-2\fboxrule,frame={\fboxrule}]{tiger}|\\
\begin{minipage}{4cm}
\includegraphics[width=\textwidth-2\fboxrule,frame={\fboxrule}]{tiger}
\end{minipage}

\medskip

% third example: good, the frame is drawn inside the picture
\verb|\includegraphics[width=\textwidth,frame={\fboxrule} {-\fboxrule}]{tiger}|\\
\begin{minipage}{4cm}
\includegraphics[width=\textwidth,frame={\fboxrule} {-\fboxrule}]{tiger}
\end{minipage}
\end{document}
```

Don't include the `minipage` environments, they are just to show the effect while using `\textwidth` (that's reset in a `minipage`) and not having a huge picture of the result.
