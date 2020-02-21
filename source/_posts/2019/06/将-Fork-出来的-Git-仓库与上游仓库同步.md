---
title: 将 Fork 出来的 Git 仓库与上游仓库同步
date: 2019-06-24 16:19:59
updated: 2020-02-21 14:51:17
categories: 版本控制系统
tags: Git
---
以下步骤均基于文件无冲突的情况，如果出现冲突，需要先解决冲突才能继续。

添加上游仓库：

```
git remote add upstream <上游仓库 URL>
```

拉取上游仓库（可选使用 `rebase` 参数）：

```
git pull --rebase upstream master
```

将本地仓库上传到个人远程仓库：

```
git push origin master
```
