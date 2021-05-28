---
title: sleep() in JavaScript
date: 2020-08-28 19:50:35
categories: JavaScript
tags:
abbrlink: 50
---
```javascript
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

async function demo() {
  console.log('Taking a break...')
  await sleep(2000)
  console.log('Two seconds later, showing sleep in a loop...')

  // Sleep in loop
  for (let i = 0; i < 5; i++) {
    if (i === 3)
      await sleep(2000)
    console.log(i)
  }
}

demo()
```

This is it. `await sleep(<duration>)`.

Or as a one-liner:

```javascript
await new Promise(r => setTimeout(r, 2000))
```

<!-- more -->

## Note

`await` can only be executed in functions prefixed with the `async` keyword, or at the top level of your script in some environments (e.g. the Chrome DevTools console, or Runkit).

`await` only pauses the current `async` function

Two new JavaScript features helped write this "sleep" function:

- [Promises, a native feature of ES2015](https://ponyfoo.com/articles/es6-promises-in-depth) (aka ES6). We also use [arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) in the definition of the sleep function.
- The `async`/`await` feature lets the code explicitly wait for a promise to settle (resolve or reject).

## References

- https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
