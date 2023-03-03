---
title: Checking a Character Is Fullwidth or Halfwidth in Python
date: 2022-08-31 15:02:58
categories: Python
tags:
abbrlink: 102
references:
  - https://stackoverflow.com/questions/23058564/checking-a-character-is-fullwidth-or-halfwidth-in-python
---
You can check the width of the character using `unicodedata.east_asian_width(unichr)`:

```python
import unicodedata

for char in string:
    status = unicodedata.east_asian_width(char)
    if status == 'F':
        print('{0} is full-width.'.format(char))
    elif status == 'H':
        print('{0} is half-width.'.format(char))
```

It has the following returned values:

```
# East_Asian_Width (ea)

ea ; A         ; Ambiguous
ea ; F         ; Fullwidth
ea ; H         ; Halfwidth
ea ; N         ; Neutral
ea ; Na        ; Narrow
ea ; W         ; Wide
```

Returned values of `'W'`, `'F'` and `'A'` should be considered as full-width on Windows.

Reference: http://www.unicode.org/reports/tr44/tr44-4.html#Validation_of_Enumerated

On POSIX platform, the quote characters (`u'“'` and `u'”'`) are considered as ambiguous, which are actually 1 character width in console. For console usage, you may try a 3rd-party library `urwid`:

```python
>>> from urwid.util import str_util
>>> str_util.get_width(ord(u'x'))
1
>>> str_util.get_width(ord(u'“'))
1
>>> str_util.get_width(ord(u'你'))
2
```
