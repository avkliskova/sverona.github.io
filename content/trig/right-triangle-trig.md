---
title: Right triangle trigonometry
description: Content from section 7.2 in OpenSTAX.
date: 2021-09-01
math: true
---

[Here's textbook section 7.2, which these notes cover.](https://openstax.org/books/algebra-and-trigonometry/pages/7-2-right-triangle-trigonometry)

<style type="text/css">
article div {
}
</style>

In this section, we'll focus on obtaining angles from distances in *right triangles.*

The first and most important thing we'll need is the *Pythagorean theorem.*

{{% div class="theorem" %}}
Let \\(A \leq B < C\\) be the sides of a right triangle. Then we have
\\[A^2 + B^2 = C^2.\\]
(See diagram in class.)
{{% /div %}}

{{% div class="definition" %}}
1. The longest side of a right triangle is called the *hypotenuse.*
2. The other two sides of a right triangle are called the *legs.*
{{% /div %}}

{{% div class="example" %}}
A right triangle has legs of 5 and 12. Find the length of the hypotenuse.
{{% /div %}}

In addition, this works in reverse --- the Pythagorean theorem provides a quick way to tell whether a triangle is right. Simply compare the square of the longest side to the sum of the squares of the other two sides.

{{% div class="example" %}}
Determine whether the following triangles are right.
1. Sides of 3, 4, and 5.
2. Sides of 3, 5, and 6.
3. Sides of \\(2\sqrt 6,\\) \\(2\sqrt3,\\) and 6.
{{% /div %}}

Next we'll define two new functions of an angle that output a distance.{{% sidenote %}}These two will be our best friends for the remainder of this class.{{% /sidenote %}}

{{% div class="definition" %}}
Let \\(\theta\\) be either non-right angle in a right triangle. Then, referring to the diagram in class, we define the functions *sine* and *cosine* as follows:

\\[\begin{aligned}
\sin \theta &= \frac{\text{length of opposite side}}{\text{length of hypotenuse}} = \frac{o}{h}, \newline
\cos \theta &= \frac{\text{length of adjacent side}}{\text{length of hypotenuse}} = \frac{a}{h}.
\end{aligned}\\]
{{% /div %}}

{{% div class="example" %}}
In a 3-4-5 right triangle (see diagram in class,) compute
1. \\(\sin \alpha\\) and \\(\cos \alpha.\\)
2. \\(\sin \beta\\) and \\(\cos \beta.\\)

Do you notice a pattern? Why might this be?
{{% /div %}}

## Special values of sine and cosine

There are only a few values of sine and cosine that we can compute exactly; for most angles not listed in the below table we'll get messy numbers.

| \\(\theta\\) | \\(\sin \theta\\) | \\(\cos \theta\\) |
|-|-|-|
| \\(0^\circ = 0 \operatorname{rad}\\) | \\(0\\) | \\(1\\) |
| \\(30^\circ = \dfrac\pi 6 \operatorname{rad}\\) | \\(\dfrac1{2}\\) | \\(\dfrac{\sqrt{3}}{2} \approx 0.866\dots \\) |
| \\(45^\circ = \dfrac\pi 4 \operatorname{rad}\\) | \\(\dfrac{\sqrt2}{2}\\) | \\(\dfrac{\sqrt{2}}{2}\\) |
| \\(60^\circ = \dfrac\pi 3 \operatorname{rad}\\) | \\(\dfrac{\sqrt{3}}{2} \approx 0.866\dots \\) | \\(\dfrac{1}{2}\\)|
| \\(90^\circ = \dfrac\pi 2 \operatorname{rad}\\) | \\(1\\) | \\(0\\)

Do you notice any patterns here?

## Special right triangles

There are two kinds of right triangles that you should be able to recognize.

{{% div class="definition" %}}
1. A *30-60-90* right triangle has angles of 30, 60, and 90 degrees.
2. A *45-45-90* right triangle has angles of 45, 45, and 90 degrees.
{{% /div %}}

These triangles are important because they allow us to use the aforementioned special values of sine and cosine. See diagrams in class.

{{% div class="example" %}}
1. A right triangle has a side of 5 opposite an angle of 30 degrees. Find the other angles and sides.
2. A 45-45-90 right triangle has a hypotenuse of 20. Find the other two sides.

Write out the sine and cosine of the angles in these triangles.
{{% /div %}}

## Modelling with right triangles

{{% div class="example" %}}
Suppose you want to determine the height of a faraway mountain. You know the distance to the spot on the ground under its summit. (See diagram in class.)

You use a telescope to measure the *angle of inclination* of the summit; that is, you sight the peak and measure how far inclined from horizontal it is.

How high is the mountain if:

1. the distance on the ground is 5 miles and the angle of inclination is 30 degrees?
2. the distance on the ground is \\(d\\) miles and the angle of inclination is \\(\theta?\\)

{{% /div %}}

{{% div class="example" %}}
What if you know the height of the mountain and want to measure the distance? Suppose you know that the mountain is 6 miles tall, and you measure an angle of inclination of 45 degrees. How far is it on the ground in feet?
{{% /div %}}

## Other trigonometric functions

There are four other possible ratios that we can construct from a given right triangle. What are they?
