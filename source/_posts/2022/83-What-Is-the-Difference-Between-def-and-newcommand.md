---
title: What Is the Difference Between \def and \newcommand?
date: 2022-03-18 16:03:30
categories: LaTeX
tags:
abbrlink: 83
references:
  - https://tex.stackexchange.com/questions/655/what-is-the-difference-between-def-and-newcommand
---
What are the differences between `\def` and `\newcommand?`

`\def` is a TeX primitive, `\newcommand` is a LaTeX overlay on top of `\def`. The most obvious benefits of `\newcommand` over `\def` are:

1. `\newcommand` checks whether or not the command already exists.
2. `\newcommand` allows you to define an optional argument.

In general, anything that `\newcommand` does can be done by `\def`, but it usually involves a little trickery and unless you want something that `\newcommand` can't do, there's no point in reinventing the wheel.

---

**Q1:** Is it possible to have parameters passed to \defed commands, both optional and required?

**A1:** Yes and No. A command defined using `\def` has to know exactly what its options are, and how they will be presented to it. However, a TeX command can be a bit clever and examine things other than its arguments. The way that optional commands are handled is to look at the next character in the stream and if it is [ then one version of the command is called, whereas if it isn't then another is called. So if you're prepared to do some hackery, then optional arguments are possible via `\def`, but it isn't half so easy as `\newcommand`.

---

**Q2:** Is there a `\redef` command equivalent to `\renewcommand`?

**A2:** No. Since `\def` doesn't check for a command already being defined, you can redefine stuff simply using `\def` again. To get the checking, you need to use the `\@ifundefined` command (note the ampersat (`@`) sign!).

---

**Q3:** I have only ever used `\newcommand` -- is there any reason I should change that habit?

**A3:** No.
