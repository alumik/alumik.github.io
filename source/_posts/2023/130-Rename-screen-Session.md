---
title: Rename screen Session
date: 2023-07-16 16:43:29
categories: Linux 系统和软件
tags: Screen
abbrlink: 130
references:
  - https://askubuntu.com/questions/257421/list-all-human-users
---
## TL;DR

{% code %}
C-a :sessionname mySessionName
{% endcode %}

## Details

This is,

1. Attach to the session in question.
2. Press Ctrl+A.
3. Type `:sessionname mySessionName` – yes, the first colon is needed there, no extra spaces.
4. Type Enter.

## Renaming without attaching

Screen's `-X` switch lets you rename a session without attaching it.

{% code lang:sh %}
screen -S 8890.foo -X sessionname bar
{% endcode %}