---
title: Force Detach Screen From Another SSH Session
standard: 1
date: 2025-04-25 18:05:37
categories: Linux 系统和软件
tags: Screen
abbrlink: 136
references:
  - https://stackoverflow.com/questions/20807696/how-do-i-force-detach-screen-from-another-ssh-session
---
## Option 1: Using `-d -r`

`screen -d -r` should do the trick.
This is a combination of two commands.

`screen -d` detaches the already-running screen session, and `screen -r` reattaches the existing session.
By running `screen -d -r`, you force screen to detach it and then resume the session.

## Option 2: List displays

### Short answer

1. Reattach without ejecting others: `screen -x`
2. Get list of displays: `^A *`, select the one to disconnect, press <kbd>D</kbd>

### Explained answer

{% note info %}
`PREFIX` is usually `^A` = <kbd>Ctrl</kbd> + <kbd>A</kbd> .
{% endnote %}

1. Reattach a session: `screen -x`.

    `-x` attach to a not detached screen session without detaching it.

2. List displays of this session: `PREFIX *`.

    It is the default key binding for: `PREFIX :displays`.
    Performing it within the screen, identify the other display we want to disconnect (e.g. smaller size).
    (Your current display is displayed in brighter color/bold when not selected).

    ```
    term-type   size         user interface           window       Perms
    ---------- ------- ---------- ----------------- ----------     -----
    screen     240x60         you@/dev/pts/2      nb  0(zsh)        rwx
    screen      78x40         you@/dev/pts/0      nb  0(zsh)        rwx
    ```
    
    Using arrows <kbd>↑</kbd> <kbd>↓</kbd> , select the targeted display, press <kbd>D</kbd> .
    If nothing happens, you tried to detach your own display and screen will not detach it.
    If it was another one, within a second or two, the entry will disappear.

3. Press <kbd>Enter</kbd> to quit the listing.
