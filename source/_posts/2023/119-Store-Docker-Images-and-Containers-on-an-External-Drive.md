---
title: Store Docker Images and Containers on an External Drive
date: 2023-03-03 03:26:03
categories: 容器与虚拟机
tags: Docker
abbrlink: 119
references:
  - https://www.howtogeek.com/devops/how-to-store-docker-images-and-containers-on-an-external-drive/
---
Docker stores downloaded images, running containers, and persistent volume data in a single shared directory root on your system drive. You can customize your configuration to use an external drive, network share, or second internal disc if you need to add storage to your installation.

## Preparation

The main part of this guide applies to Docker Engine for Linux and Docker Desktop on Windows and Mac. You'll need to find your Docker `daemon.json` file on all three platforms. This will be in one of the following locations:

- `/etc/docker/daemon.json` on Linux.
- `%programdata%\docker\config\daemon.json` on Windows.
- `~/Library/Containers/com.docker.docker/Data/database/com.docker.driver.amd64-linux/etc/docker/daemon.json` on Mac.

Docker advises that Windows and Mac users update the config file via the UI, instead of manually applying changes in a text editor. You can access the settings screen by heading to Preferences > Docker Engine > Edit file in the Docker Desktop interface.

<!-- more -->

## Changing Your Data Directory

The location of Docker's data directory is controlled by the `data-root` setting in your config file. Old Docker versions released prior to 17.06 used `graph` instead.

Find or add the relevant key inside the config file. Set your desired directory path as its value. Here's a Linux example that'll store Docker data to an external drive mounted in the filesystem:

```json
{
    "data-root": "/mnt/docker-data"
}
```

You must restart the Docker daemon after you make the change:

```sh
sudo service docker restart
```

Docker Desktop can be restarted on Windows and Mac by exiting it and then launching a new instance.

You should copy the contents of your current data directory to the new path if you want to retain your existing content. Otherwise you'll start with a clean slate, unable to access previously created containers and images.

```sh
sudo rsync -aSv /var/lib/docker/ /mnt/docker-data
```

## Changing the Data Directory Without a Restart

You can move your data directory without restarting the daemon by creating a symlink from `/var/lib/docker` to your new location. This could be useful if you're running out of space on a host where an unscheduled Docker service restart isn't a viable option.

Copy your existing Docker data to your new directory:

```sh
sudo rsync -aSv /var/lib/docker/ /mnt/docker-data
```

Then create a symlink that resolves `/var/lib/docker` to the target location:

```sh
sudo ln -s /mnt/docker-data/ /var/lib/docker
```

Don't use this technique for workloads that rapidly modify filesystem data. There's a risk of inconsistencies occurring if data gets written in the time between you copying the existing directory and creating the symlink.

## What Actually Changes?

Changing Docker's root directory affects all the different data types that the daemon stores. This includes your images, containers, installed plugins, Swarm configuration, and volumes, as well as the Docker build cache.

Modifying the path will write all this data to your new location. You can't selectively move specific types to separate mount points. This means it's important to select a storage location that will offer good overall performance. Using a slow external drive could harm the responsiveness of docker CLI operations, even if it would suit certain types of data such as long-term image storage.

In the absence of per-type data path support, pruning unused resources can be a better way to manage Docker's storage requirements. Instead of allocating Docker more space, clean up redundant assets and push unused images to a separate central registry. This can free up considerable space on your host.

## One-Time Use of a Different Data Directory

You can manually start Docker Engine with a specific data directory by passing the `--data-root` flag when you start the daemon. This can be used to switch between data directories or run a clean instance without your existing data.

```sh
sudo /usr/bin/dockerd --data-root /mnt/docker-data
```

The flag will override the directory path specified by the `daemon.json` file. The configured directory will remain intact so you can revert to that instance in the future.

## Summary

Docker stores all its data including built and pulled images, created containers, and volumes within a single directory tree. The root is usually `/var/lib/docker` but you can customize it by adding a setting to your config file or supplying the `--data-root` flag when you start the daemon.

Changing the data directory means your existing data won't appear in Docker unless you copy it to the new path. You can use this feature to maintain several independent Docker storage repositories, such as one for personal projects and another for work. You'll need to restart the daemon before you switch contexts though, as only one instance can run concurrently.
