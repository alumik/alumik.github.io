---
title: Uninstall Older Versions of a Installed PowerShell Module
date: 2021-08-26 15:34:32
categories: Windows 系统和软件
tags: PowerShell
abbrlink: 70
references:
  - https://www.myerrorsandmysolutions.com/how-to-uninstall-older-versions-of-a-powershell-module-installed/
---
When using Windows PowerShell, it's possible to use a PowerShell module. Copy and paste the following PowerShell script that retrieves the latest version of the desired module and then recursively uninstalls the previous versions installed. Interesting to note, you can use the `-WhatIf` parameter at the end to simulate and preview the changes without doing them (remember to remove `-WhatIf` parameter when you want to apply the changes and to set the `$ModuleName` to the desired PowerShell module).

{% code lang:powershell %}
$ModuleName = 'oh-my-posh';
$Latest = Get-InstalledModule $ModuleName; 
Get-InstalledModule $ModuleName -AllVersions | ? {$_.Version -ne $Latest.Version} | Uninstall-Module -WhatIf
{% endcode %}
