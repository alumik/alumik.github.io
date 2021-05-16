---
title: Recursively Delete All Files of a Specific Extension in the Current Directory
date: 2021-04-19 20:37:07
categories: Linux
tags:
abbrlink: 61
---
Use `find`:

```
find . -name "*.bak" -type f -delete
```

But use it with precaution. Run first:

```
find . -name "*.bak" -type f
```

to see exactly which files you will remove.

{% note danger %}
Make sure that `-delete` is the last argument in your command. If you put it before the `-name *.bak argument`, it will delete **everything**.
{% endnote %}

## References

- https://askubuntu.com/questions/377438/how-can-i-recursively-delete-all-files-of-a-specific-extension-in-the-current-di