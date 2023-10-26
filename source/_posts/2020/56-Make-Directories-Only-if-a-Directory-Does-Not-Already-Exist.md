---
title: Make Directories Only if a Directory Does Not Already Exist
date: 2020-12-04 04:01:51
categories: Linux 系统和软件
tags: Shell 脚本
abbrlink: 56
references:
  - https://stackoverflow.com/questions/793858/how-to-mkdir-only-if-a-directory-does-not-already-exist
---
Try `mkdir -p`:

{% code %}
mkdir -p foo
{% endcode %}

Note that this will also create any intermediate directories that don't exist; for instance,

{% code %}
mkdir -p foo/bar/baz
{% endcode %}

will create directories *foo*, *foo/bar*, and *foo/bar/baz* if they don't exist.

Some implementation like GNU `mkdir` include `mkdir --parents` as a more readable alias, but this is not specified in POSIX/Single Unix Specification. It is also not available on many common platforms like macOS, various BSDs, and various commercial Unixes, so it should be avoided.
