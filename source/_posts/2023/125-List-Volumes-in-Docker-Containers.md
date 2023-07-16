---
title: List Volumes in Docker Containers
date: 2023-03-16 03:04:30
categories: 容器与虚拟机
tags: Docker
abbrlink: 125
references:
  - https://stackoverflow.com/questions/30133664/how-do-you-list-volumes-in-docker-containers
---
With Docker 1.8.1 (August 2015), a `docker inspect -f '{{ .Volumes }}' containerid` would be empty!

You now need to check `Mounts`, which is a list of mounted paths like:

```json
{
  "Mounts": [
      {
          "Name": "7ced22ebb63b78823f71cf33f9a7e1915abe4595fcd4f067084f7c4e8cc1afa2",
          "Source": "...",
          "Destination": "...",
          "Driver": "local",
          "Mode": "",
          "RW": true
      }
  ]
}
```

If you want the path of the first mount (for instance), that would be (using index 0):

```sh
docker inspect -f '{{ (index .Mounts 0).Source }}' containerid
```

Pretty print the whole thing:

```sh
docker inspect -f '{{ json .Mounts }}' containerid | python -m json.tool
```

Or use the `jq` command:

```sh
docker inspect -f '{{ json .Mounts }}' containerid | jq
```
