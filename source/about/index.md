---
title: 关于
date: 2021-08-29 15:49:34
comments: true
description: " "
toc:
  enable: false
---
<script>
  fetch('https://v1.hitokoto.cn')
    .then(res => res.json())
    .then(data => {
      let hitokoto_content = document.getElementsByClassName('post-description')[0]
      hitokoto_content.innerText = data.hitokoto
    })
    .catch(err => console.error(err))
</script>

我是钟震宇 (AlumiK)，一个来自中国四川的程序员，目前生活在天津。我主攻深度学习、智能运维、高性能计算以及自然语言处理等研究领域。

在这个网站里，我记录了一些在我的科研工作中遇到的问题以及一些解决方案，希望有幸能帮助到你们。
