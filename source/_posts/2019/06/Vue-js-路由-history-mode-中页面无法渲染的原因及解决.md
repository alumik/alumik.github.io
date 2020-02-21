---
title: Vue.js 路由 history mode 中页面无法渲染的原因及解决
categories: JavaScript
tags: Vue.js
abbrlink: 58592
date: 2019-06-24 17:00:40
---
## Vue.js 路由 history mode 中页面无法渲染的原因

用 Vue.js + vue-router 创建单页应用，是非常简单的。使用 Vue.js ，我们已经可以通过组合组件来组成应用程序，当你要把 vue-router 添加进来，我们需要做的是，将组件（components）映射到路由（routes），然后告诉 vue-router 在哪里渲染它们。

一般开发的单页应用的 URL 都是带有 # 号的 hash 模式，因为整个应用本身而言就只有一个 HTML ，其他的都是通过 router 来渲染。如果因为业务需要，或者单纯是觉得带 # 号不美观，那么可以使用 history 模式，简单而言就是在 router 的配置文件 index.js 中添加如下一行代码

```javascript
mode: 'history'
```

没错，这样 URL 不再会有 # 号，你会发现整个地址栏回到了你熟悉的那个样子，不过接下来介绍的就非常的重要了。

## 404 错误

在 history mode 下，如果直接通过地址栏访问路径，那么会出现 404 错误，这是因为调用了 history.pushState API 所以所有的跳转之类的操作都是通过 router 来实现的。要解决这个问题很简单，只需要在后台配置如果 URL 匹配不到任何静态资源，就跳转到默认的 *index.html* 。以 Apache2 为例，具体配置如下

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteRule ^index\.html$ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule . /index.html [L]
</IfModule>
```

## 每次点击链接都要刷新页面的问题

众所周知，开发单页应用就是因为那丝般顺滑的体验效果。出现这个的原因是因为使用了 `window.location` 来跳转，只需要使用使用 router 提供的方法，就能够解决这个问题：

在 *main.js* 中配置中将 router 绑定到全局

```javascript
Vue.prototype.router = router
```

之后都使用如下的方式来控制跳转

```javascript
this.router.push('xxx')
```
