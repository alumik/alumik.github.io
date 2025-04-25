---
title: Remove Steam Games from Programs and Features (Add/Remove Programs)
standard: 1
date: 2025-04-25 18:27:10
categories: Windows 系统和软件
tags: Steam
abbrlink: 137
references:
  - https://furgelnod.com/2014/removing-steam-games-from-programs-and-features-windows/
---
When installed, games from Steam are registered in Windows’ uninstall list as well as in Steam.
The uninstall items in “add / remove programs” serve little purpose as they are links directly to Steam’s app management (easily accessed from Steam’s UI), and if you relocate your Steam folder these will become broken.

The following is two commands to run and a downloadable batch file (also contains an admin check) that remove all Steam apps from the Windows uninstall list.
I figure it may come in handy if someone can’t be bothered writing or doesn’t know how to write it themselves.

{% note warning %}
You will need to run these with administrative privileges.
{% endnote %}

Download: [remove-steam-uninstall-links-from-windows.bat](https://furgelnod.com/wp-content/uploads/2016/09/remove-steam-uninstall-links-from-windows.zip) (zipped)

*sha1: cc540bc3e4022de0d45424e7bfd9b47045031b75*


```batch
@for /F "delims=" %a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall ^| findstr /C:"Steam App"') do @reg delete "%a" /f
@for /F "delims=" %a in ('reg query HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall ^| findstr /C:"Steam App"') do @reg delete "%a" /f
```
