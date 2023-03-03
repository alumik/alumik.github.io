---
title: Is Multiplying Loss by 0.0 the Same as Not Having the Loss?
date: 2023-03-03 03:51:28
categories: 深度学习
tags:
abbrlink: 121
references:
  - https://discuss.pytorch.org/t/is-multiplying-loss-by-0-0-the-same-as-not-having-the-loss/165078
---
Multiplying the loss with 0.0 will create zero gradients. However, your model could still "change". For example, since running stats are updated in each forward pass in batchnorm layers during training (i.e. if the model is in model.train() mode). Also, the optimizer could still update parameters if its using running stats (e.g. Adam) and if the parameters were already updated (i.e. if the running stats are already set) even if the gradient is set to zero.
