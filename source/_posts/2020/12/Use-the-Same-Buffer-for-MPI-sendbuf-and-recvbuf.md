---
title:  Use the Same Buffer for MPI sendbuf and recvbuf
date: 2020-12-04 03:01:51
categories: C++
tags: MPI
abbrlink: 55
---
According to `MPI_AllReduce` man page and MPI doc `MPI_IN_PLACE` can be used to specify the same buffer for `sendbuf` and `recvbuf` as long as you are working inside the same group.

The call would look like:

```cpp
double rho[1024];
// Some operation to calculate rho for each process
MPI_Allreduce(MPI_IN_PLACE, rho, 1024, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
```

## 参考链接

- https://stackoverflow.com/questions/16507865/can-mpi-sendbuf-and-recvbuf-be-the-same-thing/16508381
