---
title: Switch Boot Target to Text or GUI in systemd Linux
date: 2022-10-10 18:57:39
categories: Linux 系统和软件
tags:
  - Ubuntu
  - systemd
abbrlink: 110
references:
  - https://www.cyberciti.biz/faq/switch-boot-target-to-text-gui-in-systemd-linux/
---
Most modern Linux distro uses `systemd` as `init` replacement.
It is a suite of basic building blocks for Linux distros such as RHEL/CentOS, OpenSUSE/SUSE, Fedora, Arch, Debian, Ubuntu, and more.
By default, most distro boot into GUI, but you can change to text or vice versa.

The older version of the Linux distros came with SysV `init` or Upstart.
Such `init` provided a set of runlevels for text, multi user, and GUI system.
However, `systemd` uses the concept of targets instead of runlevels.
This page explains procedures to implement runlevel like config when working with `systemd` targets.
In other words, you will learn how to switch between text or GUI mode using `systemd` instead of `init` levels on modern Linux distros.

<!-- more -->

## Switch Boot Target to Text

The procedure is as follows to change into a text mode runlevel under `systemd`:

1. Open the terminal application.
2. For remote Linux servers, use the SSH command.
3. Find which target unit is used by default:

    {% code %}
    systemctl get-default
    {% endcode %}

4. To change boot target to the text mode:

    {% code %}
    sudo systemctl set-default multi-user.target
    {% endcode %}

5. Reboot the system using the reboot command:

    {% code %}
    sudo reboot
    {% endcode %}

## Switch Boot Target to GUI (Graphical UI)

Want to revert change boot to GUI instead of console/text mode? Try:

1. Open the Linux terminal application.
2. Again, for remote Linux servers, use the SSH command.
3. Find which target unit is used by default:

    {% code %}
    systemctl get-default
    {% endcode %}

4. To change boot target to the GUI mode:

    {% code %}
    sudo systemctl set-default graphical.target
    {% endcode %}

5. Make sure you reboot the Linux box using the reboot command:

    {% code %}
    sudo reboot
    {% endcode %}

## Understanding Boot Targets Under systemd

The default target is set by `/etc/systemd/system/default.target`.
Run the following `ls` command to verify it using the symbolic link:

{% code %}
ls -l /etc/systemd/system/default.target
{% endcode %}

Of course, we can use the `systemctl` command itself too:

{% code %}
systemctl get-default
{% endcode %}

### Listing all systemd targets

Execute the following command:

{% code %}
systemctl list-units --type target
# list all loaded units in any state #
systemctl list-units --type target --all
{% endcode %}

Here is a list of all currently loaded target units on Ubuntu Linux 20.04 LTS desktop:

{% code %}
  UNIT                                 LOAD   ACTIVE SUB    DESCRIPTION                                       
  basic.target                         loaded active active Basic System                                      
  blockdev@dev-mapper-md1_crypt.target loaded active active Block Device Preparation for /dev/mapper/md1_crypt
  bluetooth.target                     loaded active active Bluetooth                                         
  cryptsetup.target                    loaded active active Local Encrypted Volumes                           
  getty.target                         loaded active active Login Prompts                                     
  graphical.target                     loaded active active Graphical Interface                               
  local-fs-pre.target                  loaded active active Local File Systems (Pre)                          
  local-fs.target                      loaded active active Local File Systems                                
  machines.target                      loaded active active Containers                                        
  multi-user.target                    loaded active active Multi-User System                                 
  network-online.target                loaded active active Network is Online                                 
  network-pre.target                   loaded active active Network (Pre)                                     
  network.target                       loaded active active Network                                           
  nss-user-lookup.target               loaded active active User and Group Name Lookups                       
  paths.target                         loaded active active Paths                                             
  remote-fs-pre.target                 loaded active active Remote File Systems (Pre)                         
  remote-fs.target                     loaded active active Remote File Systems                               
  slices.target                        loaded active active Slices                                            
  sockets.target                       loaded active active Sockets                                           
  sound.target                         loaded active active Sound Card                                        
  swap.target                          loaded active active Swap                                              
  sysinit.target                       loaded active active System Initialization                             
  time-set.target                      loaded active active System Time Set                                   
  time-sync.target                     loaded active active System Time Synchronized                          
  timers.target                        loaded active active Timers                                            
  virt-guest-shutdown.target           loaded active active Libvirt guests shutdown                           

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

26 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
{% endcode %}

## SysV Runleves vs systemd Targets

Let us understand older SysV runlevels and their equivalents under `systemd`.

| `systemd` Target                        | `runlevel` | Description                                                                                                    | Old Command | New Command                          |
| --------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------------- | ------- | ------------------------------------ |
| `runlevel0.target`, `poweroff.target`   | 0          | Power off the Linux box.                                                                                       | `init 0`      | `systemctl isolate poweroff.target`  |
| `runlevel1.target`, `rescue.target`     | 1          | Boot into emergency rescue mode (single user mode).                                                            | `init 1`      | `systemctl isolate rescue.target`    |
| `runlevel2.target`, `multi-user.target` | 2          | Text based multi-user system that does not configure network interfaces and does not export networks services. | `init 2`      | `systemctl isolate runlevel2.target` |
| `runlevel3.target`, `multi-user.target` | 3          | Starts the system normally in multi-user text mode for the Linux server usage.                                 | `init 3`      | `systemctl isolate runlevel3.target` |
| `runlevel4.target`, `multi-user.target` | 4          | For special purposes text mode.                                                                                | `init 4`      | `systemctl isolate runlevel4.target` |
| `runlevel5.target`, `graphical.target`  | 5          | Same as runlevel 3 and boot into GUI display manager.                                                          | `init 5`      | `systemctl isolate graphical.target` |
| `runlevel6.target`, `reboot.target`     | 6          | Reboot the Linux desktop or laptop.                                                                            | `init 6`      | `systemctl isolate reboot.target`    |

### How to change the default systemd target using symbolic link

Earlier I explained how to use the `systemctl` command.
But one can use other commands.
Therefore, use the `ln` command as follows to switch to the GUI mode:

{% code %}
sudo ln -s -f -v \
/lib/systemd/system/graphical.target \
/etc/systemd/system/default.target
{% endcode %}

Want to go back to the text mode:

{% code %}
sudo ln -s -f -v \
/lib/systemd/system/multi-user.target \
/etc/systemd/system/default.target
{% endcode %}

Verify it using the `ls` command

{% code %}
ls -l /etc/systemd/system/default.target
{% endcode %}
