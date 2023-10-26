---
title: Display Numbers Using Comma as a Thousands Separator
date: 2022-03-18 15:56:29
categories: LaTeX
tags:
abbrlink: 82
references:
  - https://tex.stackexchange.com/questions/6104/how-to-display-numbers-using-comma-as-a-thousands-separator
---
The `siunitx` package has this sort of facility.

{% code lang:tex %}
\num[group-separator={,}]{1234567890}
{% endcode %}

Should give you "1,234,567,890".

Also you can use this as a package option like so:

{% code lang:tex %}
\usepackage[group-separator={,}]{siunitx}
{% endcode %}

Be warned, this doesn't seem to work with older versions of `siunitx`.
