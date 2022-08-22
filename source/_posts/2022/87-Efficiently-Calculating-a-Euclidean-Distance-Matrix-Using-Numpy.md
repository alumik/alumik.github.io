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

```python
# build a complex array of your points
z = np.array([complex(p.x, p.y) for p in points])
```

## First Solution

```python
# mesh this array so that you will have all combinations
m, n = np.meshgrid(z, z)
# get the distance via the norm
distance_matrix = abs(m - n)
```

## Second Solution

Meshing is the main idea. But numpy is clever, so you don't have to generate `m` & `n`. Just compute the difference using a transposed version of `z`. The mesh is done automatically:

```python
distance_matrix = abs(z[..., np.newaxis] - z)
```

And if `z` is directly set as a 2-dimensional array, you can use `z.T` instead of the weird `z[..., np.newaxis]`. So finally, your code will look like this:

```python
z = np.array([[complex(p.x, p.y) for p in points]])  # notice the [[ ... ]]
distance_matrix = abs(z.T - z)
```
