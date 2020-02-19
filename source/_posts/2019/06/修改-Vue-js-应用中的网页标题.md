---
title: 修改 Vue.js 应用中的网页标题
date: 2019-06-24 17:33:12
categories:
- JavaScript
- Vue.js
tags:
---
## 配置路由属性

可以简单地在路由中设置 `meta` 属性。

例如在 *src/router/index.js* 中

```javascript
routes: [
    {
        path: '...',
        name: '...',
        meta: { title: '...' },
        component: () => import('...')
    }
]
```

## 使用路由钩子

利用路由的 `beforeEach` 方法修改网站标题。

```javascript
router.beforeEach((to, from, next) => {
    document.title = to.meta.title
    next()
})
```
