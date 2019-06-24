---
title: How to Set Flags for OpenMP in CMake
date: 2019-06-24 21:24:30
categories: C++
tags:
---
CMake has a [standard module](https://cmake.org/cmake/help/latest/module/FindOpenMP.html) for testing if the compiler supports OpenMP.

```cmake
find_package(OpenMP)
if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
    set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
endif()
```
