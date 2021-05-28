---
title: 在 CMake 中添加 MPI 支持
date: 2020-11-30 08:43:16
categories: C++
tags: 
    - MPI
    - CMake
abbrlink: 54
---
CMakeLists.txt 示例

```cmake
cmake_minimum_required(VERSION 3.17)
project(MPITest)

find_package(MPI REQUIRED)
include_directories(${MPI_INCLUDE_PATH})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_COMPILER mpicxx)
set(CMAKE_C_COMPILER mpicc)

add_executable(${PROJECT_NAME} main.cpp)
```
