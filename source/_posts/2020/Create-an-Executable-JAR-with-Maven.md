---
title: Create an Executable JAR with Maven
categories: Java
tags: Maven
abbrlink: 46
date: 2020-05-22 10:13:43
references:
  - https://www.baeldung.com/executable-jar-with-maven
---
## Introduction

In this quick article we'll focus on packaging a Maven project into an executable Jar file.

Usually, when creating a jar file, we want to execute it easily, without using the IDE. To that end, we'll discuss the configuration and pros/cons of using each of these approaches for creating the executable.

## Configuration

In order to create an executable jar, we don't need any additional dependencies. We just need to create Maven Java project, and have at least one class with the `main` method.

In our example, we created Java class named `ExecutableMavenJar`.

We also need to make sure that our *pom.xml* contains the following elements:

```xml
<modelVersion>4.0.0</modelVersion>
<groupId>com.baeldung</groupId>
<artifactId>core-java</artifactId>
<version>0.1.0-SNAPSHOT</version>
<packaging>jar</packaging>
```

The most important aspect here is the type – to create an executable jar, double-check the configuration uses a `jar` type.

Now we can start using the various solutions.

<!-- more -->

### Manual Configuration

Let's start with a manual approach – with the help of the `maven-dependency-plugin`.

First, we'll copy all required dependencies into the folder that we'll specify:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-dependency-plugin</artifactId>
    <executions>
        <execution>
            <id>copy-dependencies</id>
            <phase>prepare-package</phase>
            <goals>
                <goal>copy-dependencies</goal>
            </goals>
            <configuration>
                <outputDirectory>
                    ${project.build.directory}/libs
                </outputDirectory>
            </configuration>
        </execution>
    </executions>
</plugin>
```

There are two important aspects to notice. First, we specify the goal `copy-dependencies`, which tells Maven to copy these dependencies into the specified `outputDirectory`.

In our case, we'll create a folder named `libs`, inside the project build directory (which is usually the *target* folder).

In the second step, we are going to create executable and class path aware jar, with the link to the dependencies copied in the first step:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jar-plugin</artifactId>
    <configuration>
        <archive>
            <manifest>
                <addClasspath>true</addClasspath>
                <classpathPrefix>libs/</classpathPrefix>
                <mainClass>
                    com.baeldung.executable.ExecutableMavenJar
                </mainClass>
            </manifest>
        </archive>
    </configuration>
</plugin>
```

The most important part of above-mentioned is the manifest configuration. We add a classpath, with all dependencies (folder *libs/*), and provide the information about the main class.

Please note, that we need to provide fully qualified named of the class, which means it will include package name.

The advantages and disadvantages of this approach are:

- **pros** – transparent process, where we can specify each step
- **cons** – manual, dependencies are out of the final jar, which means that your executable jar will only run if the *libs* folder will be accessible and visible for a jar

### Apache Maven Assembly Plugin

The Apache Maven Assembly Plugin allows users to aggregate the project output along with its dependencies, modules, site documentation, and other files into a single, runnable package.

The main goal in the assembly plugin is the [single](https://maven.apache.org/plugins/maven-assembly-plugin/single-mojo.html) goal – used to create all assemblies (all other goals are deprecated and will be removed in a future release).

Let's take a look at the configuration in *pom.xml*:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-assembly-plugin</artifactId>
    <executions>
        <execution>
            <phase>package</phase>
            <goals>
                <goal>single</goal>
            </goals>
            <configuration>
                <archive>
                <manifest>
                    <mainClass>
                        com.baeldung.executable.ExecutableMavenJar
                    </mainClass>
                </manifest>
                </archive>
                <descriptorRefs>
                    <descriptorRef>jar-with-dependencies</descriptorRef>
                </descriptorRefs>
            </configuration>
        </execution>
    </executions>
</plugin>
```

Similarly to the manual approach, we need to provide the information about the main class; the difference is that the Maven Assembly Plugin will automatically copy all required dependencies into a jar file.

In the `descriptorRefs` part of the configuration code, we provided the name, that will be added to the project name.

Output in our example will be named as `core-java-jar-with-dependencies.jar`.

- **pros** – dependencies inside the jar file, one-file only
- **cons** – basic control of packaging your artifact, for example, there is no class relocation support

### Apache Maven Shade Plugin

Apache Maven Shade Plugin provides the capability to package the artifact in an uber-jar, which consists of all dependencies required to run the project. Moreover, it supports shading – i.e., rename – the packages of some dependencies.

Let's take a look at the configuration:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-shade-plugin</artifactId>
    <executions>
        <execution>
            <goals>
                <goal>shade</goal>
            </goals>
            <configuration>
                <shadedArtifactAttached>true</shadedArtifactAttached>
                <transformers>
                    <transformer implementation=
                      "org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                        <mainClass>com.baeldung.executable.ExecutableMavenJar</mainClass>
                </transformer>
            </transformers>
        </configuration>
        </execution>
    </executions>
</plugin>
```

There are three main parts of this configuration:

First, `<shadedArtifactAttached>` marks all dependencies to be packaged into the jar.

Second, we need to specify [the transformer implementation](https://maven.apache.org/plugins/maven-shade-plugin/usage.html); we used the standard one in our example.

Finally, we need to specify the main class of our application.

The output file will be named `core-java-0.1.0-SNAPSHOT-shaded.jar`, where `core-java` is our project name, followed by snapshot version and plugin name.

- **pros** – dependencies inside the jar file, advanced control of packaging your artifact, with shading and class relocation
- **cons** – complex configuration (especially if we want to use advanced features)

### One Jar Maven Plugin

Another option to create executable jar is the One Jar project.

This provides custom classloader that knows how to load classes and resources from jars inside an archive, instead of from jars in the filesystem.

Let's take a look at the configuration:

```xml
<plugin>
    <groupId>com.jolira</groupId>
    <artifactId>onejar-maven-plugin</artifactId>
    <executions>
        <execution>
            <configuration>
                <mainClass>org.baeldung.executable.
                  ExecutableMavenJar</mainClass>
                <attachToBuild>true</attachToBuild>
                <filename>
                  ${project.build.finalName}.${project.packaging}
                </filename>
            </configuration>
            <goals>
                <goal>one-jar</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

As it is shown in the configuration, we need to specify the main class and attach all dependencies to build, by using `attachToBuild = true`.

Also, we should provide the output filename. Moreover, the goal for Maven is `one-jar`. Please note, that One Jar is a commercial solution, that will make dependency jars not expanded into the filesystem at runtime.

- **pros** – clean delegation model, allows classes to be at the top-level of the One Jar, supports external jars and can support Native libraries
- **cons** – not actively supported since 2012

### Spring Boot Maven Plugin

Finally, the last solution we'll look at is the Spring Boot Maven Plugin.

This allows to package executable jar or war archives and run an application "in-place".

To use it we need to use at least Maven version 3.2. The detailed description is available [here](https://docs.spring.io/spring-boot/docs/1.4.1.RELEASE/maven-plugin/).

Let's have a look at the config:

```xml
<plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
    <executions>
        <execution>
            <goals>
                <goal>repackage</goal>
            </goals>
            <configuration>
                <classifier>spring-boot</classifier>
                <mainClass>
                  com.baeldung.executable.ExecutableMavenJar
                </mainClass>
            </configuration>
        </execution>
    </executions>
</plugin>
```

There are two differences between Spring plugin and the others. First, the goal of the execution is called `repackage`, and the classifier is named `spring-boot`.

Please note, that we don't need to have Spring Boot application in order to use this plugin.

- **pros** – dependencies inside a jar file, you can run it in every accessible location, advanced control of packaging your artifact, with excluding dependencies from the jar file etc., packaging of war files as well
- **cons** – adds potentially unnecessary Spring and Spring Boot related classes

## Conclusion

In this article, we described many ways of creating an executable jar with various Maven plugins.

The full implementation of this tutorial can be found in [this (executable jar)](https://github.com/eugenp/tutorials/tree/master/core-java-modules/core-java-jar) and [this (executable war)](https://github.com/eugenp/tutorials/tree/master/spring-thymeleaf-2) GitHub projects.

How to test? In order to compile the project into an executable jar, please run Maven with mvn clean package command.

Hopefully, this article gives you some more insights on the topic, and you will find your preferred approach depending on your needs.

One quick final note – make sure the licenses of the jars you're bundling don't prohibit this kind of operation. Generally, that won't be the case, but it's something worth considering.
