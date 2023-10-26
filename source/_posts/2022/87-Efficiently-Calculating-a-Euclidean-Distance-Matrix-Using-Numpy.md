---
title: Efficiently Calculating a Euclidean Distance Matrix Using Numpy
date: 2022-04-06 21:21:00
categories: Python
tags: Numpy
abbrlink: 87
references:
  - https://stackoverflow.com/questions/22720864/efficiently-calculating-a-euclidean-distance-matrix-using-numpy
---
You can take advantage of the `complex` type:

{% code lang:python %}
# build a complex array of your points
z = np.array([complex(p.x, p.y) for p in points])
{% endcode %}

## First Solution

{% code lang:python %}
# mesh this array so that you will have all combinations
m, n = np.meshgrid(z, z)
# get the distance via the norm
distance_matrix = abs(m - n)
{% endcode %}

## Second Solution

Meshing is the main idea. But numpy is clever, so you don't have to generate `m` & `n`. Just compute the difference using a transposed version of `z`. The mesh is done automatically:

{% code lang:python %}
distance_matrix = abs(z[..., np.newaxis] - z)
{% endcode %}

And if `z` is directly set as a 2-dimensional array, you can use `z.T` instead of the weird `z[..., np.newaxis]`. So finally, your code will look like this:

{% code lang:python %}
z = np.array([[complex(p.x, p.y) for p in points]])  # notice the [[ ... ]]
distance_matrix = abs(z.T - z)
{% endcode %}
