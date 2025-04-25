---
title: 解决Windows 10 简体中文补充字体更新失败的问题
standard: 1
date: 2025-04-25 17:50:30
categories: Windows 系统和软件
tags:
abbrlink: 135
references:
  - https://www.hshh.org/blog/20250329_windows_supplemental_fonts_install_failed
---
近期碰到 Windows 10 不停弹出简体中文补充字体 (Chinese (Simplified) Supplemental Fonts) 安装失败的通知。
具体表现为通知中心出现一个图标带“字”的通知。该问题可以通过删除该可选组件并重新安装解决。

1. 开启管理员模式的 Powershell 命令行.
2. 获取组件名称

    ```powershell
    Get-WindowsCapability -online -name *fonts* | ft Name, DisplayName, Description
    ```
    
    请根据实际输出确认该组件的名称。在作者的计算机上可以得知该组件名称为 `Language.Fonts.Hans~~~und-HANS~0.0.1.0`。

3. 删除该组件

    ```powershell
    Remove-WindowsCapability -Online -Name Language.Fonts.Hans~~~und-HANS~0.0.1.0
    ```

4. 重新安装该组件

    ```powershell
    Add-WindowsCapability -Online -Name Language.Fonts.Hans~~~und-HANS~0.0.1.0
    ```
