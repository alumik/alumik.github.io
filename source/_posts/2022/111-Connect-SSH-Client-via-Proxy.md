---
title: Connect SSH Client via Proxy
date: 2022-10-11 09:25:48
categories: Linux
tags: SSH
abbrlink: 111
references:
  - https://www.simplified.guide/ssh/connect-via-socks-proxy
---
A proxy act as an intermediary host where you could tunnel your connection through the proxy to access another host.
Tunneling your SSH connection via a proxy, among other things, could allow you to access hosts in a private network or under a NAT.
As such, a proxy avoids the need to set up a more complex infrastructure such as a VPN.

OpenSSH's SSH client supports connecting through both SOCKS and HTTPS proxy.
It is achieved with the `ProxyCommand` option alongside third-party programs such as `nc` or `netcat`.

Steps to connect to SSH server via SOCKS or HTTPS proxy:

1. Create SOCKS or HTTPS proxy if you don't already have one.
2. Test if the SOCKS or HTTPS proxy is reachable from the SSH client's host (optional).

    ```
    $ nc -zv 127.0.0.1 2222
    Connection to 127.0.0.1 2222 port [tcp/*] succeeded!
    ```

    {% note info %}
    ```
    -v      Produce more verbose output.
    -z      Only scan for listening daemons, without sending any data to
            them.  Cannot be used together with -l.
    ```
    {% endnote %}

3. Use `ProxyCommand` as option for SSH client.

    ```
    $ ssh -o ProxyCommand='nc -X4 -x 127.0.0.1:2222 %h %p' remoteuser@remotehost
    ```

    {% note info %}
    ```
    -X proxy_protocol
            Use proxy_protocol when talking to the proxy server.  Supported
            protocols are 4 (SOCKS v.4), 5 (SOCKS v.5) and connect (HTTPS
            proxy).  If the protocol is not specified, SOCKS version 5 is
            used.

    -x proxy_address[:port]
            Connect to destination using a proxy at proxy_address and port.
            If port is not specified, the well-known port for the proxy pro‐
            tocol is used (1080 for SOCKS, 3128 for HTTPS).  An IPv6 address
            can be specified unambiguously by enclosing proxy_address in
            square brackets.  A proxy cannot be used with any of the options
            -lsuU.
    ```
    {% endnote %}

4. Add `ProxyCommand` to SSH client configuration file for persistence.

    ```
    $ cat .ssh/config
    Host remotehost
        hostname 192.168.1.10
        user remoteuser
        ProxyCommand nc -X4 -x 127.0.0.1:2222 %h %p
    ```

5. Connect again using SSH client with just the Host name as parameter.

    ```
    $ ssh remotehost
    ```
