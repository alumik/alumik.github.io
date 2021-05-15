---
title: Automatic Exit From Bash Shell Script on Error
date: 2020-12-04 05:01:51
categories: Linux
tags: Shell 脚本
abbrlink: 57
---
Use the `set -e` builtin:

```sh
#!/bin/bash

set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
```

Alternatively, you can pass `-e` on the command line:

```
bash -e my_script.sh
```

You can also disable this behavior with `set +e`.

You may also want to employ all or some of the the `-e` `-u` `-x` and `-o` pipefail options like so:

```sh
set -euxo pipefail
```

`-e` exits on error, `-u` errors on undefined variables, and `-o` (for option) pipefail exits on command pipe failures.

*Note:

The shell does **not** exit if the command that fails is part of the command list immediately following a `while` or `until` keyword, part of the test following the `if` or `elif` reserved words, part of any command executed in a `&&` or `||` list except the command following the final `&&` or `||`, any command in a pipeline but the last, or if the command's return value is being inverted with `!`.

## 参考链接

- https://stackoverflow.com/questions/2870992/automatic-exit-from-bash-shell-script-on-error
