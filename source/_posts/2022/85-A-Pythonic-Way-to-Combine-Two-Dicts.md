---
title: A Pythonic Way to Combine Two Dicts
date: 2022-04-06 21:09:55
categories: Python
tags:
abbrlink: 85
references:
  - https://stackoverflow.com/questions/11011756/is-there-any-pythonic-way-to-combine-two-dicts-adding-values-for-keys-that-appe
---
For example I have two dicts:

{% code lang:python %}
dict_a = {'a': 1, 'b': 2, 'c': 3}
dict_b = {'b': 3, 'c': 4, 'd': 5}
{% endcode %}

I need a pythonic way of 'combining' two dicts such that the result is:

{% code lang:python %}
{'a': 1, 'b': 5, 'c': 7, 'd': 5}
{% endcode %}

That is to say: if a key appears in both dicts, add their values, if it appears in only one dict, keep its value.

Use `collections.Counter`:

{% code lang:python %}
from collections import Counter
a = Counter({'a':1, 'b':2, 'c':3})
b = Counter({'b':3, 'c':4, 'd':5})
c = a + b  # c = Counter({'c': 7, 'b': 5, 'd': 5, 'a': 1})
{% endcode %}

Counters are basically a subclass of dict, so you can still do everything else with them you'd normally do with that type, such as iterate over their keys and values.
