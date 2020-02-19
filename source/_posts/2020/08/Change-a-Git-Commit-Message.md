---
title: Change a Git Commit Message
date: 2020-08-23 00:37:43
categories: 版本控制系统
tags: Git
abbrlink: 48
---
When working with Git, you might encounter a situation where you need to edit a commit message. There are many reasons you would want to make the change, such as fixing a typo, removing sensitive information, or adding additional information.

This guide explains how to change the message of the most recent or older Git commits.

<!-- more -->

## Changing the Most Recent Commit

The `git commit --amend` command allows you to change the most recent commit message.

### Not pushed commit

To change the message of the most recent commit that has not been pushed to the remote repository, commit it again using the `--amend` flag.

1. [Navigate](https://linuxize.com/post/linux-cd-command/) to the repository directory in your terminal.

2. Run the following command to amend (change) the message of the latest commit:

    ```
    git commit --amend -m "New commit message."
    ```

    What the command does is overwriting the most recent commit with the new one.

    The `-m` option allows you to write the new message on the command line without opening an editor session.

Before changing the commit message, you can also add other changes you previously forgot:

```
git add .
git commit --amend -m "New commit message."
```

### Pushed commit

The amended (changed) commit is a new entity with a different SHA-1. The previous commit will no longer exist in the current branch.
Generally, you should avoid amending a commit that is already pushed as it may cause issues to people who based their work on this commit. It is a good idea to consult your fellow developers before changing a pushed commit.

If you changed the message of most recently pushed commit, you would have to force push it.

1. Navigate to the repository.

2. Amend the message of the latest pushed commit:

    ```
    git commit --amend -m "New commit message."
    ```

    Force push to update the history of the remote repository:

    ```
    git push --force branch-name
    ```

## Changing an Older or Multiple Commits

If you need to change the message of an older or multiple commits, you can use an interactive `git rebase` to change one or more older commits.

The `rebase` command rewrites the commit history, and it is strongly discouraged to rebase commits that are already pushed to the [remote Git repository](https://linuxize.com/post/how-to-setup-a-git-server/).

1. Navigate to the repository containing the commit message you want to change.

2. Type `git rebase -i HEAD~N`, where `N` is the number of commits to perform a rebase on. For example, if you want to change the 4th and the 5th latest commits you would type:

    ```
    git rebase -i HEAD~5
    ```

    The command will display the latest `X` commits in your [default text editor](https://linuxize.com/post/how-to-use-nano-text-editor/):

    ```
    pick 43f8707f9 fix: update dependency json5 to ^2.1.1
    pick cea1fb88a fix: update dependency verdaccio to ^4.3.3
    pick aa540c364 fix: update dependency webpack-dev-server to ^3.8.2
    pick c5e078656 chore: update dependency flow-bin to ^0.109.0
    pick 11ce0ab34 fix: Fix spelling.

    # Rebase 7e59e8ead..11ce0ab34 onto 7e59e8ead (5 commands)
    ```

3. Move to the lines of the commit message you want to change and replace `pick` with `reword`:

    ```
    reword 43f8707f9 fix: update dependency json5 to ^2.1.1
    reword cea1fb88a fix: update dependency verdaccio to ^4.3.3
    pick aa540c364 fix: update dependency webpack-dev-server to ^3.8.2
    pick c5e078656 chore: update dependency flow-bin to ^0.109.0
    pick 11ce0ab34 fix: Fix spelling.

    # Rebase 7e59e8ead..11ce0ab34 onto 7e59e8ead (5 commands)
    ```

4. Save the changes and close the editor.

5. For each chosen commit, a new text editor window will open. Change the commit message, save the file, and close the editor.

6. Force push the changes to the remote repository:

    ```
    git push --force branch-name
    ```

## Conclusion

To change the most recent commit message, use the `git commit --amend` command. To change an older or multiple commit messages, use `git rebase -i HEAD~N`.

Don't amend pushed commits as it may potentially cause a lot of problems to your colleagues.

---

**参考链接**

- https://linuxize.com/post/change-git-commit-message/
