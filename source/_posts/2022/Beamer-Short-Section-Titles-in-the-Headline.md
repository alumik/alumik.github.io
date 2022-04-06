---
title: 'Beamer: Short Section Titles in the Headline'
date: 2022-04-06 21:01:40
categories: LaTeX
tags: Beamer
abbrlink: 84
references:
  - https://tex.stackexchange.com/questions/145004/beamer-short-section-titles-in-headline
---
I have a beamer template for a presentation. In this template, the headline shows the section name and the subsection to which the current slide belongs to. However, even if I have defined a short title as in

```tex
\section[Short title]{The very long title that surely is way too long}
```

the headline always shows the long title.

Here is the code from the style file which shows the section name

```tex
\pgftext[at=\pgfpoint{\beamer@headline@lmargin}{-0.55\beamer@headline@height},left,center]{%
    \begin{beamercolorbox}[dp=0.5ex]{section in head/foot}
        \shadowtextline{\insertsection}
    \end{beamercolorbox}
}
```

So my question: Is there any other command for `\insertsection` in order to show the short title?

The outer theme should use `\insertsectionhead` instead of `\insertsection`:

```tex
\documentclass{beamer}

\begin{document}

\section[Short section title]{Long section title}

\begin{frame}
  Long title: \insertsection

  Short title: \insertsectionhead
\end{frame}

\end{document}
```
