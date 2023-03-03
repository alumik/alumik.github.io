---
title: 消除 Windows 安全中心基于声誉的保护上的感叹号
date: 2022-09-15 10:08:02
categories: Windows 系统和软件
tags: Windows 安全中心
abbrlink: 104
references:
  - https://www.zhihu.com/question/506553302
---
Windows 安全中心基于声誉的保护如果提示有威胁，但是点开发现什么都没有，这是因为该威胁已经由于手动或者其他原因（杀毒/清理类软件）被删除了，而 Windows 安全中心的的提醒里并没有把这个威胁删掉。所以需要我们手动清理一下这个历史记录。

1. 首先打开 `C:\ProgramData\Microsoft\Windows Defender\Scans`。
2. 这个时候提示需要系统权限，授权后，继续打开 `History\Service\DetectionHistory`。
3. 最终路径：`C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service\DetectionHistory`。
4. 把里面的文件全部删除，即可解决问题。

{% note warning %}
不能直接复制最终路径，系统会提示无权限打开。
{% endnote %}
