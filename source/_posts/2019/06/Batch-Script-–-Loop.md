---
title: Batch Script – Loop
date: 2019-06-24 20:50:19
categories: Windows
tags: Batchfile
---
`for /l` is your friend:

```bat
for /l %x in (1, 1, 100) do echo %x
```

Starts at 1, steps by one, and finishes at 100.

Use two `%`s if it's in a batch file:

```bat
for /l %%x in (1, 1, 100) do echo %%x
```

If you have multiple commands for each iteration of the loop, do this:

```bat
for /l %x in (1, 1, 100) do (
   echo %x
   copy %x.txt z:\whatever\etc
)
```

or in a batch file:

```bat
for /l %%x in (1, 1, 100) do (
   echo %%x
   copy %%x.txt z:\whatever\etc
)
```

Key:

+ `/l` denotes that the `for` command will operate in a numerical fashion, rather than operating on a set of files.
+ `%x` is the loops variable.
+ (starting value, increment of value, end condition\[inclusive\])
