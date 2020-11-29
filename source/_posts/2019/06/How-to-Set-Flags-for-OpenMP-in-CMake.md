---
title: How to Set Flags for OpenMP in CMake
categories: C++
tags:
  - OpenMP
  - CMake
abbrlink: 37
date: 2019-06-24 21:24:30
---
CMake has a [standard module](https://cmake.org/cmake/help/latest/module/FindOpenMP.html) for testing if the compiler supports OpenMP.

```cmake
cmake_minimum_required(VERSION 3.17)
project(OpenMPTest)

set(CMAKE_CXX_STANDARD 20)

add_executable(${PROJECT_NAME} main.cpp)

find_package(OpenMP REQUIRED)  # Find the package
target_link_libraries(${PROJECT_NAME} PRIVATE OpenMP::OpenMP_CXX)  # Link against it for C++
```

---

**参考链接**

+ https://stackoverflow.com/questions/56202041/compiling-and-linking-against-openmp-with-appleclang-on-mac-os-x-mojave
+ https://stackoverflow.com/questions/12399422/how-to-set-linker-flags-for-openmp-in-cmakes-try-compile-function
