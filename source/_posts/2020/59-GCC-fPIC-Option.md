---
title: GCC -fPIC Option
date: 2020-12-11 17:10:25
categories: C++
tags:
abbrlink: 59
references:
  - https://stackoverflow.com/questions/5311515/gcc-fpic-option
---
Position Independent Code means that the generated machine code is not dependent on being located at a specific address in order to work.

E.g., jumps would be generated as relative rather than absolute.

Pseudo-assembly:

- PIC: This would work whether the code was at address 100 or 1000

    {% code %}
    100: COMPARE REG1, REG2
    101: JUMP_IF_EQUAL CURRENT+10
    ...
    111: NOP
    {% endcode %}

- Non-PIC: This will only work if the code is at address 100

    {% code %}
    100: COMPARE REG1, REG2
    101: JUMP_IF_EQUAL 111
    ...
    111: NOP
    {% endcode %}

If your code is compiled with `-fPIC`, it's suitable for inclusion in a library. The library must be able to be relocated from its preferred location in memory to another address, there could be another already loaded library at the address your library prefers.
