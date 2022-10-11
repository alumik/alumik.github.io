---
title: Clear, Delete or Disable Windows 10 File Explorer Search History
date: 2020-08-30 15:01:43
categories: Windows 系统和软件
tags:
abbrlink: 53
references:
  - https://www.groovypost.com/howto/clear-disable-windows-10-file-explorer-search-history/
---
Windows will keep a history of the items you have searched over time. So, each time you type in a search query, you will see a list of recently searched items. You might want to clear this from time to time, especially if you're on a shared PC or if you just want a fresh start. We already showed you [how to turn off autocomplete in File Explorer](https://www.groovypost.com/howto/turn-autocomplete-windows-10-file-explorer-on-off/). For even more control over file navigation, here is a look at how to clear recent File Explorer search history or disable it altogether.

{% asset_img Search-History-Windows-10-File-Explorer.webp %}

<!-- more -->

## Clear File Explorer Search History

You can simply clear your recent search history by selecting the Search tab in File Explorer and going to *Recent Searches > Clear search History*.

{% asset_img Clear-Search-history.webp %}

## Disable File Explorer Search History

If you don't want to clear your history all the time, you can completely disable it from keeping track of your searches. In Windows 10 Pro, you can turn off search history in Group Policy, but for Windows 10 Home, you need to do a bit of tweaking in the Registry.

### In Windows 10 Pro

If you're running Windows 10 Professional, you can turn it off via Group Policy. Hit the keyboard combo **Windows Key + R** and type `gpedit.msc` in the Run dialog and hit Enter or click OK.

{% asset_img 1-gpedit.webp %}

Then navigate to `User Configuration\Administrative Templates\Windows Components\File Explorer`. Double-click on "Turn off display of recent search entries in the File Explorer search box" policy in the right pane and set it to Enabled, click OK, and close out of Group Policy Editor.

{% asset_img 2-group-policy-editor-search-box-policy.webp %}

### In Windows 10 Home

{% note info %}
Windows 10 Home doesn't include Group Policy, so you need to hack the Registry. Before making any changes to the Registry make sure to do a full system backup or create a Restore Point first.
{% endnote %}

Hit **Windows Key + R** and type `regedit` in the Run line and hit Enter or click OK.

{% asset_img 2-Regedit.webp %}

Then head to `HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer`. Right-click in the right pane and create a new DWORD (32-bit) Value and name it `DisableSearchBoxSuggestions` and give it a value of `1`.

{% asset_img disable-file-explorer-search-history-collection-Windows-10.webp %}

After you're done, close out of the Registry, and you will need to log off or restart your system before you will see the change. You will no longer see the history of past searches in File Explorer. If you want to enable it later, just go back and change the value of `DisableSearchBoxSuggestions` to `0`.
