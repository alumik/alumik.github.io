---
title: Config Default Port for Node Exporter Service
date: 2022-08-31 14:59:51
categories: Linux
tags: Node Exporter
abbrlink: 101
references:
  - https://stackoverflow.com/questions/57194072/how-to-config-default-port-of-node-exporter
---
Just add `--web.listen-address=:9100` behind `ExecStart=/usr/local/bin/node_exporter` in the config file.

It looks like

```
ExecStart=/usr/local/bin/node_exporter --web.listen-address=:[custum port]
```