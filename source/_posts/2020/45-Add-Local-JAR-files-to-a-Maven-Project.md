---
title: Add Local JAR files to a Maven Project
categories: Java
tags: Maven
abbrlink: 45
date: 2020-05-22 09:56:11
references:
  - https://stackoverflow.com/questions/364114/can-i-add-jars-to-maven-2-build-classpath-without-installing-them
---
## Problems of popular approaches

Most of the answers you'll find around the internet will suggest you to either install the dependency to your local repository or specify a "system" scope in the `pom` and distribute the dependency with the source of your project. But both of these solutions are actually flawed.

### Why you shouldn't apply the "Install to Local Repo" approach

When you install a dependency to your local repository it remains there. Your distribution artifact will do fine as long as it has access to this repository. The problem is in most cases this repository will reside on your local machine, so there'll be no way to resolve this dependency on any other machine. Clearly making your artifact depend on a specific machine is not a way to handle things. Otherwise this dependency will have to be locally installed on every machine working with that project which is not any better.

### Why you shouldn't apply the "System Scope" approach

The jars you depend on with the "System Scope" approach neither get installed to any repository or attached to your target packages. That's why your distribution package won't have a way to resolve that dependency when used. That I believe was the reason why the use of system scope even got deprecated. Anyway you don't want to rely on a deprecated feature.

<!-- more -->

## The static in-project repository solution

After putting this in your `pom`:

{% code lang:xml %}
<repository>
    <id>repo</id>
    <releases>
        <enabled>true</enabled>
        <checksumPolicy>ignore</checksumPolicy>
    </releases>
    <snapshots>
        <enabled>false</enabled>
    </snapshots>
    <url>file://${project.basedir}/repo</url>
</repository>
{% endcode %}

for each artifact with a group id of form x.y.z Maven will include the following location inside your project dir in its search for artifacts:

{% code %}
repo/
| - x/
|   | - y/
|   |   | - z/
|   |   |   | - ${artifactId}/
|   |   |   |   | - ${version}/
|   |   |   |   |   | - ${artifactId}-${version}.jar
{% endcode %}

To elaborate more on this you can read [this blog post](http://blog.dub.podval.org/2010/01/maven-in-project-repository.html).

## Use Maven to install to project repo

Instead of creating this structure by hand I recommend to use a Maven plugin to install your jars as artifacts. So, to install an artifact to an in-project repository under `repo` folder execute:

{% code %}
mvn install:install-file -DlocalRepositoryPath=repo -DcreateChecksum=true -Dpackaging=jar -Dfile=[your-jar] -DgroupId=[...] -DartifactId=[...] -Dversion=[...]
{% endcode %}

If you'll choose this approach you'll be able to simplify the repository declaration in `pom` to:

{% code lang:xml %}
<repository>
    <id>repo</id>
    <url>file://${project.basedir}/repo</url>
</repository>
{% endcode %}
