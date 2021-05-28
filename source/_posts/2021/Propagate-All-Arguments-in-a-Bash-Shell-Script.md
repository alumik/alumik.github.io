---
title: Propagate All Arguments in a Bash Shell Script
date: 2021-05-15 16:21:13
categories: Linux
tags: Shell 脚本
abbrlink: 65
---
The `$@` variable expands to all command-line parameters separated by spaces. Here is an example.

```sh
abc "$@"
```

When using `$@`, you should (almost) always put it in double-quotes to avoid misparsing of arguments containing spaces or wildcards (see below). This works for multiple arguments. It is also portable to all POSIX-compliant shells.

It is also worth nothing that `$0` (generally the script's name or path) is not in `$@`.

The [Bash Reference Manual Special Parameters Section](https://www.gnu.org/software/bash/manual/bash.html#Special-Parameters) says that `$@` expands to the positional parameters starting from one. When the expansion occurs within double quotes, each parameter expands to a separate word. That is `"$@"` is equivalent to `"$1" "$2" "$3"...`.

<!-- more -->

## Passing Some Arguments

If you want to pass all but the first arguments, you can first use `shift` to "consume" the first argument and then pass `"$@"` to pass the remaining arguments to another command. In bash (and zsh and ksh, but not in plain POSIX shells like dash), you can do this without messing with the argument list using a variant of array slicing: `"${@:3}"` will get you the arguments starting with `"$3"`. `"${@:3:4}"` will get you up to four arguments starting at `"$3"` (i.e. `"$3" "$4" "$5" "$6"`), if that many arguments were passed.

## Things You Probably Don't Want to Do

`"$*"` gives all of the arguments stuck together into a single string (separated by spaces, or whatever the first character of `$IFS` is). This looses the distinction between spaces within arguments and the spaces between arguments, so is generally a bad idea. Although it might be ok for printing the arguments, e.g. `echo "$*"`, provided you don't care about preserving the space within/between distinction.

Assigning the arguments to a regular variable (as in `args="$@"`) mashes all the arguments together like `"$*"` does. If you want to store the arguments in a variable, use an array with `args=("$@")` (the parentheses make it an array), and then reference them as e.g. `"${args[0]}"` etc. Note that in bash and ksh, array indexes start at 0, so `$1` will be in `args[0]`, etc. zsh, on the other hand, starts array indexes at 1, so `$1` will be in `args[1]`. And more basic shells like dash don't have arrays at all.

Leaving off the double-quotes, with either `$@` or `$*`, will try to split each argument up into separate words (based on whitespace or whatever's in `$IFS`), and also try to expand anything that looks like a filename wildcard into a list of matching filenames. This can have really weird effects, and should almost always be avoided. (Except in zsh, where this expansion doesn't take place by default.)

## References

- https://stackoverflow.com/questions/3811345/how-to-pass-all-arguments-passed-to-my-bash-script-to-a-function-of-mine
