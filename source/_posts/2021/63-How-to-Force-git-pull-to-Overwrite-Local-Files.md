---
title: Force "git pull" to Overwrite Local Files
date: 2021-04-19 20:47:48
categories: 版本控制系统
tags: Git
abbrlink: 63
references:
  - https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files
---
{% note danger %}
If you have any local changes, they will be lost. With or without `--hard` option, any local commits that haven't been pushed will be lost. If you have any files that are not tracked by Git (e.g. uploaded user content), these files will not be affected.
{% endnote %}

First, run a fetch to update all `origin/<branch>` refs to latest:

```
git fetch --all
```

Then, reset the current branch:

```
git reset --hard origin/<branch>
```

## Explanation

`git fetch` downloads the latest from remote without trying to merge or rebase anything.

Then the `git reset` resets the master branch to what you just fetched. The `--hard` option changes all the files in your working tree to match the files in `origin/<branch>`.

## Uncommitted Changes

Uncommitted changes, however (even staged), will be lost. Make sure to stash and commit anything you need. For that you can run the following:

```
git stash
```

Then to reapply these uncommitted changes:

```
git stash pop
```
