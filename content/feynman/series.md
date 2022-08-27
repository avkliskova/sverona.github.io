---
title: Series
date: 1946-10-16
description: Abel Summability. Summation of Series by Integration and Differentiation. Summation of Series by Adding Terms. Magnitude of Quantities. De L'Hospital's Rule. Exercises.
---


## Abel Summability {#orgc426cea}

Consider the series \\(1 - 2 + 3 - \dots.\\) Convert it
to a power series in \\(x\\) as follows: \\(S(x) = 1 - 2x + 3x^2 - \dots\\)

Sum this power series:

\\[\begin{aligned} \int S(x) ~dx &= x - x^2 + x^3 - \dots = \frac{x}{1 +
x} \newline S(x) &= \frac{d}{dx}\left[\frac{x}{1 + x}\right] = \frac1{(1 +
x)^2} \end{aligned}\\]

The Abel sum of the original series is defined as the \\(\lim\_{x \to 1-} S(x)\\).

\\[\text{Abel sum} = \lim\_{x \to 1-}\left[\frac1{(1 + x)^2}\right] =
\frac14\\]

In general, oscillating series can be summed, but the order of the terms
must not be changed.{{% sidenote %}}
Because the [Riemann rearrangement theorem](https://en.wikipedia.org/wiki/Riemann_series_theorem) says that if you get to reorder the terms you can make an oscillating series add up to anything.{{% /sidenote %}}


## Summation of Series by Integration and Differentiation {#org25387e2}


\\[\begin{aligned} S &= 1 + \frac14 + \frac19 + \frac1{16} + \dots\newline S(x)
&= x + \frac{x^2}4 + \frac{x^3}9 + \dots \newline S'(x) &= 1 + \frac{x}2 +
\frac{x^2}3 + \dots \newline &= \frac{-\ln(1 - x)}x \newline \newline S(x) &= -\int
\frac{\ln(1 - x)}x ~dx \end{aligned}\\]

One should know and recognize the series for the following expressions:

1.  \\(\frac{1}{1 - x} = 1 + x + x^2 + x^3 + \dots \\)
2.  \\(-\ln(1 - x) = x + \frac{x^2}2 + \frac{x^3}3 + \dots \\)
3.  \\(\tan^{-1}x = x - \frac{x^3}3 + \frac{x^5}5 - \frac{x^7}7 + \dots \\)
4.  \\(e^x = 1 + \frac{x}{1!} + \frac{x^2}{2!} + \frac{x^3}{3!} + \dots \\)
5.  \\(\sin x = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \dots \\)
6.  \\(\cos x = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \dots \\)
7.  \\(\frac1{(1 + x)^2} = 1 - 2x + 3x^2 - \dots \\)
8.  \\(\frac1{\sqrt{1 + x}} = 1 - \frac12 x + \frac38 x^2 -
      \frac{15}{48}x^3 + \dots \\){{% sidenote %}} The coefficient of \\(x^n\\) is \\[\frac{(2n - 1)!!}{(2n)!!} = \frac{1 \cdot 3 \cdot \dots \cdot (2n - 1)}{2 \cdot 4 \cdot \dots \cdot 2n}.\\] {{% /sidenote %}}

A useful relation: \\( e^{i\theta} = \cos \theta + i \sin \theta \\)



## Summation of Series by Adding Terms {#orgf0de35b}

Consider the series
\\(1 + \frac14 + \frac19 + \dots.\\) We can sum it as follows:
\\(1.000 + .250 + .111 + .0625 + \dots\\)

By taking enough terms we can obtain any desired accuracy. If the series
is slow to converge it is sometimes possible to replace the higher terms
by an integral:

{{% figure class="marginfigure" src="/images/baselplot.png" caption="Approximating \\(\pi^2/6\\) by \\( \int 1/x^2 ~\mathrm dx\\)" %}}

Examination of the above diagram shows that

\\[\begin{aligned} \frac1{3^2} + \frac1{4^2} + \dots &\approx \int\_{2
\frac12}^\infty \frac1{x^2} ~dx \newline &\approx \frac1{2.5} = .4.
\end{aligned}\\]

The sum of our series is then{{% sidenote %}}
Approximately; the exact value is \\(\pi^2/6 = 1.6449...\\)
{{% /sidenote %}} \\(1.000 + .250 + .400 \approx 1.650.\\)
Since the error will be principally in the first terms some idea of its
magnitude may be gotten by looking at the next best approximation:

\\[\begin{aligned} \frac1{4^2} + \frac1{5^2} + \dots &\approx \int\_{3
\frac12}^\infty \frac1{x^2} ~dx \newline &\approx .286 \end{aligned}\\]

The new sum is \\(1.000 + .250 + .111 + .286 \approx 1.647.\\) We see that
we have made an error of only \\(.003\\). We can guess from this that the
third figure is probably about 6.



## Magnitude of Quantities {#org6d54e5f}

The following quantities are arranged in the order
of their rate of rise for large \\(x\\):{{% sidenote %}}
I prefer to write \\(1/n\\) for \\(\epsilon\\), or at least I did when I taught calculus.{{% /sidenote %}}
\\[1 < \ln x < x^\epsilon < x < x^n < e^x \\]

To ascertain their behavior for small \\(y\\), make the substitution \\(y = \frac1x\\).

The following approximations hold for small \\(x\\).

\\[\begin{aligned} \sin x &\sim x \newline \cos x &\sim 1 - \frac{x^2}2 \newline
\tan^{-1}x &\sim x \sim \tan x \newline \sinh x &\sim x \newline e^x &\sim 1 + x \newline
(1 + x)^n &\sim 1 + nx \newline (1 + x)^{-1/2} &\sim 1 - \frac12 x
\end{aligned}\\]



## De L\'Hospital\'s Rule {#org075a143}

If as \\(x \to a\\), \\(f(x)\\) and \\(g(x) \to 0\\), then
\\[ \lim_{x\to a}
\frac{f(x)}{g(x)} = \lim_{x \to a} \frac{f'(x)}{g'(x)}. \\]

Example: \\[ \lim_{x \to 0} \frac{\tan x}{[(1 + x)^3 - 1]} = \lim_{x \to
0} \frac{\sec^2 x}{3(1 + x)^2} = \frac13. \\]



## Problems {#orgb8a1e3e}



1.  Sum:

\\[\begin{gathered} \frac1{2!} + \frac2{3!} + \frac3{4!} + \dots \newline
\frac{1}{1 \cdot 2} + \frac1{2 \cdot 3} + \frac1{3 \cdot 4} + \dots
\end{gathered}\\]

2.  Find
    \\[\begin{gathered}
    \lim_{x \to 0} \frac{\sin x}{e^{3x} - 1} \newline
    \lim_{x \to 0} \frac{\ln(\frac12 +
        \frac1{2\sqrt{1+x^2}})}{e^{x^2}-\cos x^2}\end{gathered}\\]

