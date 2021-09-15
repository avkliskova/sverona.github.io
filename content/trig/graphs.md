---
title: The sine and cosine curves
description: Content from section 8.1 in OpenSTAX.
date: 2021-09-15
---

Let's graph sine and cosine using the special values we know. (See diagram on board.)

\\[
\begin{array}{r|ll}
\theta & \mathbf \sin \theta & \mathbf \cos \theta \newline
\hline
0^\circ = 0 \text{ rad} & 0 & 1 \newline
30^\circ = \pi/6 \text{ rad} & 1/2 & \sqrt3/2 \newline
45^\circ = \pi/4 \text{ rad} & \sqrt2/2 & \sqrt2/2 \newline
60^\circ = \pi/3 \text{ rad} & \sqrt3/2 & 1/2 \newline
90^\circ = \pi/2 \text{ rad} & 1 & 0 \newline
\hline
120^\circ = 2\pi/3 \text{ rad} & \sqrt3/2 & -1/2 \newline
135^\circ = 3\pi/4 \text{ rad} & \sqrt2/2 & -\sqrt2/2 \newline
150^\circ = 5\pi/6 \text{ rad} & 1/2 & -\sqrt3/2 \newline
180^\circ = \pi \text{ rad} & 0 & -1 \newline
\hline
210^\circ = 7\pi/6 \text{ rad} & \dots & \dots
\end{array}
\\]

(Sasha open Desmos and graph these.)

[Here's a link that demonstrates, geometrically, the connection between this graph and the unit circle.](https://www.desmos.com/calculator/6yuhmbdlbo)

## Even and odd functions revisited

{{% div class="definition" %}}
A function \\(f\\) is *even* if \\(f(-x) = f(x).\\) A function \\(f\\) is *odd* if \\(f(-x) = -f(x).\\)
{{% /div %}}

Are sine and cosine even or odd? What about tangent? What about their reciprocals?


[Here's a link that demonstrates even symmetry "about the y-axis."](https://www.desmos.com/calculator/kbdctpadi4)

[Here's a link that demonstrates odd symmetry "about the origin."](https://www.desmos.com/calculator/wergo8mexm)

## Transformations of sine and cosine

Let's take a moment to review transformations of ordinary functions.

We always start with a *base* function, like \\(f(x) = x^2.\\)

Then we think about what steps we have to do in what order to compute \\(f(x).\\) These steps are reflected, in that same order, in the basic transformations applied to the base function to obtain \\(f(x).\\)

The following table tells how computational steps match up with transformations.

{{% div class="fullwidth" %}}
| Computation | Applied before base | Applied after base |
|-|-|-|
| Add \\(c\\) | Shift \\(c\\) units left | Shift \\(c\\) units up |
| Subtract \\(c\\) | Shift \\(c\\) units right | Shift \\(c\\) units down |
| Multiply by \\(c\\) | Compress horizontally, factor \\(c\\) | Stretch vertically, factor \\(c\\) |
| Divide by \\(c\\) | Stretch horizontally, factor \\(c\\) | Compress vertically, factor \\(c\\) |
| Negate | Flip over y-axis | Flip over x-axis |
{{% /div %}}

If the computational step occurs *before* the effect of the base function, then the corresponding transformation acts on the horizontal axis. If it occurs *after* the effect of the base function, then the transformation acts on the vertical axis.

For instance, if 3 is added *before* \\(x\\) is squared, then the function is shifted left. If instead 3 is added *after* \\(x\\) is squared, then the function is shifted upward.

{{% div class="example" %}}
Graph \\(f(x) = 3(2x - 4)^2 + 2.\\)
{{% /div %}}

To get from \\(x\\) to \\(f(x)\\) in this example, we have to:
1. Multiply by 2;
2. Subtract 4;
3. Square;
4. Multiply by 3;
5. Add 2.

These are reflected in the transformations of the function as follows.

1. Compress the base parabola by a factor of 2 horizontally.
2. Shift the parabola 4 units right.
3. (We don't do anything for this step because it's the base function.)
4. Stretch the base parabola by a factor of 3 vertically.
5. Shift the parabola 2 units upward.

These rules aren't different for sine and cosine; they operate in exactly the same way.

{{% div class="example" %}}
Graph \\(f(x) = 3\sin\left(2x - \dfrac\pi{4}\right) + 2.\\)
{{% /div %}}


