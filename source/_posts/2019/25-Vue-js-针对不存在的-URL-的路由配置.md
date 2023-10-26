---
title: Vue.js 针对不存在的 URL 的路由配置
categories: JavaScript
tags: Vue.js
abbrlink: 25
date: 2019-06-24 19:59:43
---
利用如下路由配置便可以将所有不存在的 URL 请求都引导到同一个页面（例如 404 页面）。

{% code lang:javascript %}
{
    path: '*',
    redirect: '/404'
}
{% endcode %}
