---
title: 设置 PowerShell 脚本执行策略
date: 2020-02-19 18:23:11
categories: Windows
tags: PowerShell
---
由于安全权限限制，在 PowerShell 中执行第三方脚本会失败。此时需要手动设置脚本的执行策略。

<!-- more -->

## 执行策略

脚本的执行策略有如下几种：

### AllSigned

- Scripts can run.
- Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on the local computer.
- Prompts you before running scripts from publishers that you haven't yet classified as trusted or untrusted.
- Risks running signed, but malicious, scripts.

### Bypass

- Nothing is blocked and there are no warnings or prompts.
- This execution policy is designed for configurations in which a PowerShell script is built in to a larger application or for configurations in which PowerShell is the foundation for a program that has its own security model.

### Default

- Sets the default execution policy.
- Restricted for Windows clients.
- RemoteSigned for Windows servers.

### RemoteSigned

- The default execution policy for Windows server computers.
- Scripts can run.
- Requires a digital signature from a trusted publisher on scripts and configuration files that are downloaded from the internet which includes email and instant messaging programs.
- Doesn't require digital signatures on scripts that are written on the local computer and not downloaded from the internet.
- Runs scripts that are downloaded from the internet and not signed, if the scripts are unblocked, such as by using the Unblock-File cmdlet.
- Risks running unsigned scripts from sources other than the internet and signed, but malicious, scripts.

### Restricted

- The default execution policy for Windows client computers.
- Permits individual commands, but does not allow scripts.
- Prevents running of all script files, including formatting and configuration files (.ps1xml), module script files (.psm1), and PowerShell profiles (.ps1).

### Undefined

- There is no execution policy set in the current scope.
- If the execution policy in all scopes is Undefined, the effective execution policy is Restricted, which is the default execution policy.

### Unrestricted

- The default execution policy for non-Windows computers and cannot be changed.
- Unsigned scripts can run. There is a risk of running malicious scripts.
- Warns the user before running scripts and configuration files that are not from the local intranet zone.

## 更改执行策略

一般来说，使用如下命令后能够正常使用第三方脚本：

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

**参考链接**

- https://docs.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7
