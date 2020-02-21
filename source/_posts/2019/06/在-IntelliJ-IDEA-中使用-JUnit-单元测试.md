---
title: 在 IntelliJ IDEA 中使用 JUnit 单元测试
categories: Java
tags:
  - IntelliJ IDEA
  - JUnit
abbrlink: 31
date: 2019-06-24 20:47:40
---
## 引用文件

首先需要引用 JUnit 库文件。

依次操作 File -> Project Structure… -> Libraies -> 加号 -> Java -> 选择 IDEA 安装路径 *lib* 文件夹中的 *junit-4.12.jar* 和 *hamcrest-core-1.3.jar*

## 编写测试代码

### TestJUnit.java

```java
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestJUnit {
    @Test
    public void testAdd() {
        String str = "Junit is working fine.";
        assertEquals("Junit is working fine.", str);
    }
}
```

### TestRunner.java

```java
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public class TestRunner {
    public static void main(String[] args) {
    Result result = JUnitCore.runClasses(TestJUnit.class);
    for (Failure failure : result.getFailures()) {
        System.out.println(failure.toString());
    }
    System.out.println(result.wasSuccessful());
    }
}
```

期望输出

```
true
```
