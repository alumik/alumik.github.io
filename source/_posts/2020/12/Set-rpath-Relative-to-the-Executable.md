---
title: Set rpath Relative to the Executable
date: 2020-12-11 16:54:49
categories: C++
tags:
abbrlink: 58
---
When building a binary or library, specifying the `rpath`, i.e.

```
-Wl,-rpath,<path/to/lib>
```

tells the linker where to find the required library at runtime.

In the case of `rpath`, it makes no sense to use a relative path, since a relative path will be relative to the current working directory, **NOT** relative to the directory where the binary/library was found. So it simply won't work for executables found in `$PATH` or libraries in pretty much any case.

Instead, you can use the ` $ORIGIN` "special" path to have a path relative to the executable with `-Wl,-rpath,'$ORIGIN'`. Note that you need quotes around it to avoid having the shell interpret it as a variable, and if you try to do this in a Makefile, you need ` $$` to avoid having make interpret the ` $` as well.

You normally want to pass two arguments to the linker (`-rpath` and the actual path argument), thus the comma between them. GNU ld will accept it as either two arguments or a single argument with an `=`, so either can work. Other linkers, e.g., Solaris, only accept it as two arguments.

## 参考链接

- https://stackoverflow.com/questions/38058041/correct-usage-of-rpath-relative-vs-absolute
