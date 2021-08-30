---
title: Colors in JavaScript Console
date: 2020-08-28 19:59:27
categories: JavaScript
tags:
abbrlink: 51
references:
  - https://stackoverflow.com/questions/7505623/colors-in-javascript-console
---
In Chrome & Firefox (+31) you can add CSS in console.log messages:

```javascript
console.log('%cHello, world!', 'background: red; color: green')
```

The same can be applied for adding multiple CSS to a command:

```javascript
console.log('%c<str1> %c<str2>', '<css-for-str1>', '<css-for-str2>')
```

Chrome Console API Reference: [Console API Reference](https://developers.google.com/web/tools/chrome-devtools/console/console-write#styling_console_output_with_css).
