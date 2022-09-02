---
title: Hypertrigonometric functions
date: 2022-08-20
description: In which generating functions strike again.
tags: [math, 2022, python]
math: true
---

So, I fell down a Wiki-hole today and figured I could get a blog post out of it.{{% sidenote %}}For the curious: [AuthaGraph projection](https://en.wikipedia.org/wiki/AuthaGraph_projection) &rarr; [Lee conformal world in a tetrahedron](https://en.wikipedia.org/wiki/Lee_conformal_world_in_a_tetrahedron) &rarr; [Dixon elliptic functions](https://en.wikipedia.org/wiki/Dixon_elliptic_functions). {{% /sidenote %}}

Specifically, I encountered the *Dixon elliptic functions* \\(\mathrm{sm}\\) and \\(\mathrm{cm}.\\) These satisfy a generalization of the Pythagorean identity \\[\sin^2 z + \cos^2 z = 1 \longrightarrow \operatorname{sm}^3 z + \operatorname{cm}^3 z = 1 \\] with \\(\operatorname{sm} 0 = 0, \operatorname{cm} 0 = 1.\\) I found myself wondering about an obvious generalization --- a sequence of functions \\(\mathrm{sm}\_n, \mathrm{cn}\_n\\) satisfying \\[\begin{equation\*}\operatorname{sm}\_n^n z + \operatorname{cm}\_n^n z = 1.\label{1}\tag{1}\end{equation\*}\\]

It took me a minute to find the prior art --- the [original manuscript](https://web.archive.org/web/20161024183030/http://www.maths.lth.se/matematiklu/personal/jaak/hypergf.ps){{% sidenote %}}It's in PostScript; you'll probably need `ps2pdf` to read it.{{% /sidenote %}} was written by a Swedish high school teacher, Erik Lundberg, in the nineteenth century. He called these generalizations "hypergoniometric functions." (*Goniometry*{{% sidenote %}}From the Greek, meaning "angle measure".{{% /sidenote %}} is an old-fashioned word for trigonometry.) He defines the correct \\(\mathrm{sm}\_n\\) and \\(\mathrm{cm}\_n\\) but doesn't do much with them.

## Motivation

We start from the identity \\(\eqref{1}.\\) We would also like to preserve the relation between the area and arc length of a sector of a circle; to wit, if the curve \\(x^n + y^n = 1\\) is parametrized by \\((\operatorname{cm_n} \theta, \operatorname{sm_n} \theta),\\) we desire \\[\begin{equation\*} \iint\_R \mathrm dA = \frac12 \int_0^\theta x(\theta)y'(\theta) - x'(\theta)y(\theta) ~\mathrm d\theta = \frac{\theta}2.\\end{equation\*}\\] This leads to the usual definition{{% sidenote %}}See: Shelupsky, David. "A generalization of the trigonometric functions". *The American Mathematical Monthly* 66(10) (1959): 879-884.{{% /sidenote %}} of \\(\mathrm{sm}\_n\\) and \\(\mathrm{cm}\_n\\) as the unique functions satisfying the IVP
\\[\begin{align\*} &\frac{\mathrm d}{\mathrm dz}\operatorname{sm}\_n z = \operatorname{cm}\_n^{n-1} z,\newline & \frac{\mathrm d}{\mathrm dz} \operatorname{cm}\_n z = -\operatorname{sm}\_n^{n-1} z \newline
\text{subject to} \quad & \operatorname{sm}\_n 0 = 0, \newline
& \operatorname{cm}\_n 0 = 1.
\end{align\*}\\]

## Series coefficients

The easiest way to calculate the series coefficients of these two in the general case is probably through generating functions --- taking higher derivatives gets irritating quickly, since they depend crucially on the value of \\(n.\\)

Hence we write \\[\begin{equation\*}
\operatorname{sm}\_n z = \sum_{k=0}^\infty s_{n,k} \frac{z^k}{k!}, \quad
\operatorname{cm}\_n z = \sum_{k=0}^\infty c_{n,k} \frac{z^k}{k!}.
\end{equation\*}\\]

Substituting into the defining IVP and equating coefficients gives the recurrence{{% sidenote %}}You will need to use [discrete convolution](https://en.wikipedia.org/wiki/Power_series#Multiplication_and_division) to check this.<br/><br/> Also recall that the differentiation operator on exponential GFs is the forward shift operator for sequences. {{% /sidenote %}} \\[\begin{align\*}
s_{n,k+1} &= \sum_{a_1 + \cdots + a_{n-1} = k} \binom{k}{a_1, a_2, \dots, a_{n-1}} \prod_{i=1}^{n-1} c_{n, a_i}, \newline
c_{n,k+1} &= -\sum_{a_1 + \cdots + a_{n-1} = k} \binom{k}{a_1, a_2, \dots, a_{n-1}} \prod_{i=1}^{n-1} s_{n, a_i}.
\end{align\*}\\]

It's not difficult to write some Python code for this:

```python
from functools import lru_cache


@lru_cache()
def factorial(n):
    if n < 0:
        raise ValueError
    if n == 0:
        return 1
    return n * factorial(n - 1)


def multinomial(n, A):
    if sum(A) != n:
        raise ValueError
    num = factorial(n)
    den = 1
    for a in A:
        den *= factorial(a)
    return num // den


def partitions(n, parts):
    """Enumerate partitions of `n` into `parts` or fewer parts, regarding
    differently ordered partitions as distinct."""
    if n < 0 or parts < 1:
        return
    if parts == 1:
        yield (n,)
        return
    for term in range(n + 1):
        for partition in partitions(n - term, parts - 1):
            yield (term,) + partition


@lru_cache()
def c(order, index):
    if index == 0:
        return 1
    coeffsum = 0
    for A in partitions(index - 1, order - 1):
        coeff = multinomial(index - 1, A)
        for a in A:
            coeff *= s(order, a)
        coeffsum += coeff
    return -coeffsum


@lru_cache()
def s(order, index):
    if index == 0:
        return 0
    coeffsum = 0
    for A in partitions(index - 1, order - 1):
        coeff = multinomial(index - 1, A)
        for a in A:
            coeff *= c(order, a)
        coeffsum += coeff
    return coeffsum
```

These values for the Dixon functions agree with [the](http://oeis.org/A104133) [OEIS](http://oeis.org/A104134):

```python
>>> [s(3, i) for i in range(20)]
[0, 1, 0, 0, -4, 0, 0, 160, 0, 0, -20800, 0, 0, 6476800, 0, 0, -3946624000, 0, 0, 4161608704000]
>>> [c(3, i) for i in range(20)]
[1, 0, 0, -2, 0, 0, 40, 0, 0, -3680, 0, 0, 880000, 0, 0, -435776000, 0, 0, 386949376000, 0]
```

And for the [fourth-order](http://oeis.org/A153301) [functions](http://oeis.org/A153300), which have no name that I was able to find.{{% sidenote %}}The signs aren't even standardized!{{% /sidenote %}}

```python
>>> [s(4, i) for i in range(20)]
[0, 1, 0, 0, 0, -18, 0, 0, 0, 14364, 0, 0, 0, -70203672, 0, 0, 0, 1192064637456, 0, 0]
>>> [c(4, i) for i in range(20)]
[1, 0, 0, 0, -6, 0, 0, 0, 2268, 0, 0, 0, -7434504, 0, 0, 0, 95227613712, 0, 0, 0]
```
