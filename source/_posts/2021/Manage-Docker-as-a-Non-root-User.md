---
title: Manage Docker as a Non-root User
date: 2021-12-22 16:13:17
categories: 容器与虚拟机
tags: Docker
abbrlink: 78
references:
  - https://docs.docker.com/engine/install/linux-postinstall/
---
The Docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is owned by the user `root` and other users can only access it using `sudo`. The Docker daemon always runs as the `root` user.

If you don’t want to preface the `docker` command with `sudo`, create a Unix group called `docker` and add users to it. When the Docker daemon starts, it creates a Unix socket accessible by members of the `docker` group.

{% note danger %}
The `docker` group grants privileges equivalent to the `root` user. For details on how this impacts security in your system, see [Docker Daemon Attack Surface](https://docs.docker.com/engine/security/#docker-daemon-attack-surface).
{% endnote %}

{% note info %}
To run Docker without root privileges, see [Run the Docker daemon as a non-root user (Rootless mode)](https://docs.docker.com/engine/security/rootless/).
{% endnote %}

To create the `docker` group and add your user:

1. Create the `docker` group.

    ```
    sudo groupadd docker
    ```

2. Add your user to the `docker` group.

    ```
    sudo usermod -aG docker $USER
    ```

3. Log out and log back in so that your group membership is re-evaluated.

    If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.

    On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.

    On Linux, you can also run the following command to activate the changes to groups:

    ```
    newgrp docker
    ```

4. Verify that you can run `docker` commands without `sudo`.

    ```
    docker run hello-world
    ```

    This command downloads a test image and runs it in a container. When the container runs, it prints a message and exits.

    If you initially ran Docker CLI commands using `sudo` before adding your user to the `docker` group, you may see the following error, which indicates that your `~/.docker/` directory was created with incorrect permissions due to the `sudo` commands.

    > WARNING: Error loading config file: /home/user/.docker/config.json -
    > stat /home/user/.docker/config.json: permission denied

    To fix this problem, either remove the `~/.docker/` directory (it is recreated automatically, but any custom settings are lost), or change its ownership and permissions using the following commands:

    ```
    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "$HOME/.docker" -R
    ```
