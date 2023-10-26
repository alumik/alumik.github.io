---
title: Setting Filesystem Quotas on Ubuntu 22.04
date: 2023-07-16 16:39:15
categories: Linux 系统和软件
tags: Quota
abbrlink: 128
references:
  - https://www.linode.com/docs/guides/file-system-quotas/
---
## Install the Quota Tools

1. Install the `quota` command line tools using `apt` package manager:

    {% code lang:sh %}
    sudo apt update
    sudo apt install quota
    {% endcode %}

2. Update the mount options for the filesystem by updating the corresponding entry in `/etc/fstab` configuration file, using an editor of your choice to:

    {% code %}
    # <file system> <mount point>   <type>  <options>                  <dump>  <pass>
    /dev/sda        /home           ext4    defaults,usrquota,grpquota 0       1
    {% endcode %}

The options `usrquota` and `grpquota` enables quotas on the filesystem for both users and groups.
Ensure that you add the new options separated by a comma and no spaces.

<!-- more -->

3. Remount the filesystem to apply the new options:

    {% code lang:sh %}
    sudo mount -o remount /home
    {% endcode %}

4. Verify that the new options are used to mount the filesystem:
    
    {% code lang:sh %}
    cat /proc/mounts | grep ' /home '
    {% endcode %}

5. Create the `aquota.user`, and `aquota.group` files that contain information about the limits and the usage of the filesystem:

    {% code lang:sh %}
    sudo quotacheck -ugm /home
    {% endcode %}

    The option `-u` creates the `aquota.user` file for users, the `-g` option creates the `aquota.group` file groups, and the `-m` option disables remounting the filesystem as read-only.
    You can view the quota files that are created using the `ls /home` command.

6. Turn on the quota system using:

    {% code lang:sh %}
    sudo quotaon -v /home
    {% endcode %}

## Configure Quotas for a User

To edit quota for user <example_user>, enter the following:

{% code lang:sh %}
sudo setquota -u <example_user> 100M 110M 0 0 /home
{% endcode %}

Check the new quota for the user:

{% code lang:sh %}
sudo quota -v <example_user>
{% endcode %}

If you want your users to be able to check their quotas, even if they do not have sudo access, then you need to give them permission to read the quota files you created.
Create a users group, make those files readable by the users group, and then make sure all your users are added in the group.

Also, users can check their quota usage using the `quota` command:

{% code lang:sh %}
quota -s --hide-device --show-mntpoint
{% endcode %}
