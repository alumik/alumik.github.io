---
title: 将 Fork 出来的 GitHub 仓库与上游仓库同步
date: 2019-06-24 16:19:59
categories: Git/GitHub
tags:
---
以下步骤均基于文件无冲突的情况，如果出现冲突，需要先解决冲突才能继续。

命令均在计算机本地仓库中执行。

添加上游仓库

```
git remote add upstream <上游仓库 URL>
```

拉取上游仓库（可选使用 `rebase` 参数）

```
git pull --rebase upstream master
```

将本地仓库上传到个人 GitHub 仓库

```
git push origin master
```
