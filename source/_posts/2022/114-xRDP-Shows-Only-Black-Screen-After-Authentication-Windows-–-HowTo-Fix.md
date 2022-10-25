---
title: xRDP Shows Only Black Screen After Authentication Windows – HowTo Fix !
date: 2022-10-25 20:07:25
categories: Linux 系统和软件
tags: xRDP
abbrlink: 114
references:
  - https://c-nergy.be/blog/?p=16682
---
Hello World, 

We have noticed that a lot of people hit the same issue over and over again.
When trying to connect via remote desktop protocol (rdp) to the Ubuntu machine, and after providing the credentials in the xRDP Login page, the user will only see a black screen displayed and the desktop interface is never loaded and displayed.
This post will basically explain why this happens and how to reproduce the issue.

The "problem" is actually well known and there is really an simple and easy fix for that.
So, let's explain the situation.

## Reproducing the "Black Screen" Situation

Let's assume that you have performed a successful xRDP installation and you are ready to test your rdp connection to your Ubuntu machine.
Let's also assume that you are still logged on into your Ubuntu machine system locally with your user account (which could be called User1).
So, you move to your Windows machine (or Linux machine), fire up your favorite remote desktop client and provide the ip address or the hostname.

Since xRDP installation has been successful, you will be presented with the xRDP Login page where you will need to provide the user credentials on the Ubuntu machine.
In our example, User1 (yes the one currently logged on locally on the ubuntu machine) account will be used.

If the credentials are correct, you will see your remote desktop session showing a black screen and that’s it !!!!!
The desktop interface will never load within your remote session.

## Black Screen Situation Explained

As mentioned and explained multiple times, this situation will happen (or can happen) when the same user account is used concurrently locally and remotely.
In other words, the problem is related to the fact that the same user account is already logged in locally and a remote connection is attempted at the same time.
With xRDP software solution, a specific user account can be logged on either locally or remotely but not both. 

## The (Standard) Solution

To solve this issue, there is a simple fix.
You need to ensure the account you are using to login via the remote desktop client is not currently logged on locally on the Ubuntu target machine.
If this is the case, perform a logout operation.

Try again the remote desktop session and you will see that magically, you will be able to perform your remote desktop connection and that your desktop interface will be loaded and made available for you.
