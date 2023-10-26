---
title: 清理 Conda 缓存和未使用的文件
date: 2022-07-30 17:48:45
categories: Python
tags: Conda
abbrlink: 95
references:
  - https://docs.conda.io/projects/conda/en/latest/commands/clean.html
---
# conda clean

Remove unused packages and caches.

Options:

{% code %}
usage: conda clean [-h] [-a] [-i] [-p] [-t] [-f]
                   [-c [TEMPFILES [TEMPFILES ...]]] [-l] [-d] [--json] [-q]
                   [-v] [-y]
{% endcode %}

## Removal Targets

**-a, --all**

Remove index cache, lock files, unused cache packages, and tarballs.

**-i, --index-cache**

Remove index cache.

**-p, --packages**

Remove unused packages from writable package caches.

{% note warning %}
This does not check for packages installed using symlinks back to the package cache.
{% endnote %}

**-t, --tarballs**

Remove cached package tarballs.

**-f, --force-pkgs-dirs**

Remove all writable package caches. This option is not included with the `--all` flag.

{% note warning %}
This will break environments with packages installed using symlinks back to the package cache.
{% endnote %}

**-c, --tempfiles**

Remove temporary files that could not be deleted earlier due to being in-use. Argument is path(s) to prefix(es) where files should be found and removed.

**-l, --logfiles**

Remove log files.

<!-- more -->

## Output, Prompt, and Flow Control Options

**-d, --dry-run**

Only display what would have been done.

**--json**

Report all output as json. Suitable for using conda programmatically.

**-q, --quiet**

Do not display progress bar.

**-v, --verbose**

Can be used multiple times. Once for `INFO`, twice for `DEBUG`, three times for `TRACE`.

**-y, --yes**
Do not ask for confirmation.
