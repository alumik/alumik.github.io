---
title: 'Fix: tzdata Hangs During Docker Image Build'
date: 2022-10-09 17:58:32
categories: 容器与虚拟机
tags:
  - Docker
  - tzdata
abbrlink: 106
references:
  - https://grigorkh.medium.com/fix-tzdata-hangs-docker-image-build-cdb52cc3360d
---
During the installation of a few packages, Ubuntu usually installs the `tzdata` package.
It's usually included in some PHP or Python packages dependencies.
The issue with it is that it hangs and waits for user input to continue the installation.
It's ok until we are using Docker and trying to build images (it's hanging or even throwing errors in newer versions of Ubuntu).
We will try to reproduce the situation and try to fix it.

To reproduce the hanging situation, we can use this Docker image:

```dockerfile
FROM ubuntu:20.04
RUN apt update
RUN apt install -y tzdata
```

Here is the logs that we see in terminal:

```
Step 1/3 : FROM ubuntu:20.04
 ---> 1e4467b07108
Step 2/3 : RUN apt update
 ---> Using cache
 ---> 174ce3e1bb84
Step 3/3 : RUN apt install -y tzdata
...
Configuring tzdata
------------------

Please select the geographic area in which you live. Subsequent configuration
questions will narrow this down by presenting a list of cities, representing
the time zones in which they are located.

  1. Africa      4. Australia  7. Atlantic  10. Pacific  13. Etc
  2. America     5. Arctic     8. Europe    11. SystemV
  3. Antarctica  6. Asia       9. Indian    12. US
Geographic area: 
```

And here it hangs waiting for us enter data, and even after you'll enter a region — the process will not resume.

To fix this situation we need to add lines 3 and 4 to our Dockerfile. We will create a variable called `$TZ` which will hold our timezone, and the create a `/etc/timezone` file:

```dockerfile
FROM ubuntu:20.04

ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y tzdata
```

And after building image we will see this output:

```
Step 1/5 : FROM ubuntu:20.04
 ---> 1e4467b07108
Step 2/5 : ENV TZ=Asia/Dubai
 ---> Using cache
 ---> 7f4c85bd0d3e
Step 3/5 : RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
 ---> Using cache
 ---> f6f784dfbad5
Step 4/5 : RUN apt update
 ---> Using cache
 ---> 5b1b5617eaa5
Step 5/5 : RUN apt install -y tzdata
 ---> Running in e71a917a9b6b
Current default time zone: 'Asia/Dubai'
Local time is now:      Tue Aug  4 12:14:55 +04 2020.
Universal Time is now:  Tue Aug  4 08:14:55 UTC 2020.
Run 'dpkg-reconfigure tzdata' if you wish to change it.

Removing intermediate container e71a917a9b6b
 ---> 3d29f4e8f7eb
Successfully built 3d29f4e8f7eb
Successfully tagged tzdata:latest
```

So it's used the timezone that we provide and nothing hangs.
