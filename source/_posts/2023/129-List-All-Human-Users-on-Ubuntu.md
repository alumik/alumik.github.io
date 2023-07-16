---
title: List All Human Users on Ubuntu
date: 2023-07-16 16:39:48
categories: Linux 系统和软件
tags:
abbrlink: 129
references:
  - https://askubuntu.com/questions/257421/list-all-human-users
---
While it might seem like a clear-cut idea, actually there is ambiguity in the meaning of human user.
Is a user account deliberately hidden from the login screen because it's used only for specialized purposes (but by humans) a human user?
How about the `ubuntu` user (UID 999) on the live CD? And guest accounts in Ubuntu are created on-the-fly and destroyed after logout; are they human users?
More examples could be devised.

Therefore, it's fitting that multiple, non-equivalent answers have been given.
[Saige Hamblin's solution](https://askubuntu.com/a/616604/22949) of running `ls /home` is what people actually do, and unless you're writing a script, you should probably just use that.

## Making `ls /home` More Robust

But perhaps you have users that have been removed, but whose home directories still exist in `/home`, and you must avoid listing them.
Or maybe for some other reason you must ensure only the entries in `/home` that correspond to real accounts are listed.

In that case, I suggest passing the names of everything in `/home` to getent (to retrieve the passwd entries of users with those names), then isolate and display just the username field (with grep, sed, or awk, as per your preference).
Any one of these will do:

```sh
getent passwd $(ls /home) | grep -o '^[^:]*'
```

```sh
getent passwd $(ls /home) | sed 's/:.*//'
```

```sh
getent passwd $(ls /home) | awk -F: '{print $1}'
```

This should work well, as you shouldn't have user accounts with whitespace or control characters in their names; cannot, without reconfiguring Ubuntu to allow it; and if you do, you have bigger problems.
Thus the usual problems with parsing `ls` are inapplicable.
But even though it's really okay here, if you consider command substitutions with `ls` aesthetically displeasing or just a bad habit, you may prefer:

```sh
getent passwd $(basename -a /home/*) | grep -o '^[^:]*'
```

```sh
getent passwd $(basename -a /home/*) | sed 's/:.*//'
```

```sh
getent passwd $(basename -a /home/*) | awk -F: '{print $1}'
```

These don't accommodate whitespace or control characters either.
I provide them only because `$(ls /home)` looks wrong even when it is right, and thus rubs many users the wrong way.
In most situations, there are real, good reasons to avoid parsing `ls`, and in those situations parsing `basename -a` is usually only very slightly less bad.
In this situation, however, due to the limitation on what characters may practically occur in usernames, they are both fine.
