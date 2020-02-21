---
title: 解决 OpenSSL 升级后 Shadowsocks 服务报错的问题
date: 2019-06-24 14:15:42
updated: 2020-02-21 13:51:35
categories: 网络服务
tags: 
    - Shadowsocks
    - OpenSSL
---
## 问题描述

升级 OpenSSL 后 Shadowsocks 可能无法启动，报错如下：

```
Traceback (most recent call last):
    File "/usr/bin/ssserver", line 9, in
        load_entry_point('shadowsocks==2.8.2', 'console_scripts', 'ssserver')()
    File "/usr/lib/python2.7/site-packages/shadowsocks/server.py", line 34, in main
        config = shell.get_config(False)
    File "/usr/lib/python2.7/site-packages/shadowsocks/shell.py", line 262, in get_config
        check_config(config, is_local)
    File "/usr/lib/python2.7/site-packages/shadowsocks/shell.py", line 124, in check_config
        encrypt.try_cipher(config['password'], config['method'])
    File "/usr/lib/python2.7/site-packages/shadowsocks/encrypt.py", line 44, in try_cipher
        Encryptor(key, method)
    File "/usr/lib/python2.7/site-packages/shadowsocks/encrypt.py", line 83, in __init__
        random_string(self._method_info[1]))
    File "/usr/lib/python2.7/site-packages/shadowsocks/encrypt.py", line 109, in get_cipher
        return m[2](method, key, iv, op)
    File "/usr/lib/python2.7/site-packages/shadowsocks/crypto/openssl.py", line 76, in __init__
        load_openssl()
    File "/usr/lib/python2.7/site-packages/shadowsocks/crypto/openssl.py", line 52, in load_openssl
        libcrypto.EVP_CIPHER_CTX_cleanup.argtypes = (c_void_p,)
    File "/usr/lib64/python2.7/ctypes/__init__.py", line 373, in __getattr__
        func = self.__getitem__(name)
    File "/usr/lib64/python2.7/ctypes/__init__.py", line 378, in __getitem__
        func = self._FuncPtr((name_or_ordinal, self))
AttributeError: /usr/local/ssl/lib/libcrypto.so.1.1: undefined symbol: EVP_CIPHER_CTX_cleanup
shadowsocks start failed
```

<!-- more -->

## 问题原因

这个问题是由于在新版 OpenSSL 中，废弃了 `EVP_CIPHER_CTX_cleanup()` 函数。

如官网中所说：

{% note info %}
`EVP_CIPHER_CTX` was made opaque in OpenSSL 1.1.0. As a result, `EVP_CIPHER_CTX_reset()` appeared and `EVP_CIPHER_CTX_cleanup()` disappeared. `EVP_CIPHER_CTX_init()` remains as an alias for `EVP_CIPHER_CTX_reset()`.
{% endnote %}

实际上， `EVP_CIPHER_CTX_reset()` 函数替代了 `EVP_CIPHER_CTX_cleanup()` 函数。

`EVP_CIPHER_CTX_reset()` 函数说明：

{% note info %}
`EVP_CIPHER_CTX_reset()` clears all information from a cipher context and free up any allocated memory associate with it, except the ctx itself. This function should be called anytime ctx is to be reused for another `EVP_CipherInit()` / `EVP_CipherUpdate()` / `EVP_CipherFinal()` series of calls.
{% endnote %}

`EVP_CIPHER_CTX_cleanup()` 函数说明：

{% note info %}
`EVP_CIPHER_CTX_cleanup()` clears all information from a cipher context and free up any allocated memory associate with it. It should be called after all operations using a cipher are complete so sensitive information does not remain in memory.
{% endnote %}

可以看出，二者功能基本上相同，都是释放内存，只是应该调用的时机稍有不同，所以用 `EVP_CIPHER_CTX_reset()` 代替 `EVP_CIPHER_CTX_cleanup()` 问题不大。

## 修复方法

编辑文件 */usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py* ，跳转到52行（以 Shadowsocks 2.8.2 版本为例，其他版本搜索一下 cleanup ），将 `libcrypto.EVP_CIPHER_CTX_cleanup.argtypes = (c_void_p,)` 改为 `libcrypto.EVP_CIPHER_CTX_reset.argtypes = (c_void_p,)` 。

再次搜索 cleanup （全文件共2处，此处位于111行），将 `libcrypto.EVP_CIPHER_CTX_cleanup(self._ctx)` 改为 `libcrypto.EVP_CIPHER_CTX_reset(self._ctx)` 。

保存并退出。

再次尝试启动 Shadowsocks 服务，现在应该能够正常启动了。
