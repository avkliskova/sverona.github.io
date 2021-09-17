---
title: The unit circle
description: Content from section 7.3 in OpenSTAX.
date: 2021-09-08
---

[Here's a link to section 7.3, which these notes cover.](#)

## Problem Set 2
From the [Review Exercises](https://openstax.org/books/algebra-and-trigonometry/pages/7-review-exercises) for chapter 7, do 18-48 even, except for 34.

## The unit circle

It's time to connect the circle with the angles on it with what we learned in the previous section.

{{% div class="example" %}}
Consider a circle of radius 1. Using two radii, form an angle in standard position (see diagram in class.) What happens as the angle increases from zero to \\(90^\circ\\) or \\(\pi/2\\) radians?

Consider the coordinates at special angles; show that they form special right triangles with hypotenuse 1.
{{% /div %}}

Now we will connect this to sine and cosine. Previously, these functions were only defined for non-right angles in a right triangle; that is, *acute* angles only. We shall now define them for any angle at all.

{{% div class="definition" %}}
The *sine* and *cosine* of an angle \\(\theta\\) are defined as the y- and x- coordinates of the point where an angle \\(\theta\\) in standard position intersects the unit circle.

(See diagram in class.)
{{% /div %}}

{{% div class="example" %}}
Using special right triangles, verify the values for sine and cosine of \\(0, \pi/6, \pi/4, \pi/3,\\) and \\(\pi/2\\) that were given previously.
{{% /div %}}

We can fill out the rest of the unit circle, too, because the values for sine and cosine repeat in all quadrants. however, they may be negative and they may be in reverse order.

However, there's no need to memorize them all, because we can just use the first-quadrant angles over and over again, and use symmetry.

Here's the rule to remember: Angles on the same 'X' have the same sines and cosines, up to a sign change. (See diagram in class.)

We can figure out what the sign changes are by using the quadrant of the angle.

{{% div class="example" %}}
Using the 'X' method, find the sine and cosine of \\(210^\circ\\), \\(300^\circ\\), and \\(7\pi/4\\).
{{% /div %}}

{{% div class="example" %}}
Complete the unit circle with values for sine and cosine of all indicated angles. Which functions are positive in which quadrants?
{{% /div %}}

## The other four trig functions

There are four other trigonometric functions that we need to study. Here they are:

\\[\\begin{aligned}
\tan \theta &= \frac{\text{opposite}}{\text{adjacent}} = \frac{\sin \theta}{\cos \theta} \newline
\cot \theta &= \frac{\text{adjacent}}{\text{opposite}} = \frac{\cos \theta}{\sin \theta} = \frac{1}{\tan \theta}\newline
\sec \theta &= \frac{\text{hypotenuse}}{\text{adjacent}} = \frac{1}{\cos \theta}\newline
\csc \theta &= \frac{\text{hypotenuse}}{\text{opposite}} = \frac{1}{\sin \theta}
\end{aligned}\\]

In which quadrants are these functions positive?

## Geometric meaning of trig functions

Sine and cosine are coordinates, as we have discussed. But we can also think of them as *distances* --- the length of the legs of a right triangle with hypotenuse 1.

From this viewpoint, what does tangent become?

\\[
\tan \theta = \frac{\sin \theta}{\cos \theta} = \frac{\text{length of vertical side}}{\text{length of horizontal side}} = \frac{\text{rise}}{\text{run}}
\\]

So the tangent tells us the slope of the hypotenuse! (See diagram in class.)

What about secant? Well, we can use the definition to set up a proportion: \\[ \frac{\sec \theta}1 = \frac1{\cos \theta}.\\]

This gives us a triangle similar to the sine-cosine-1 triangle.  What if we do the same for cosecant?  Where do these triangles fit on the unit circle?

So the secant is how far we have to extend the hypotenuse to get to \\(x = 1.\\) The cosecant is how far we have to extend it to get to \\(y = 1.\\)

In summary:

1. The sine and cosine of an angle are *coordinates* --- the y- and x- coordinates where the hypotenuse meets the unit circle.
2. The tangent of an angle is a *slope* --- the slope of the hypotenuse. The cotangent is the reciprocal of that slope.
3. The secant and cosecant of an angle are *distances* --- the length to which the hypotenuse must be extended to reach \\(x = 1\\) and \\(y = 1\\) respectively.

These will not be tested, but they may serve as a helpful memory aid.

{{% div class="example" %}}
What are the domain and range of the six trig functions?
{{% /div %}}

<iframe src="https://www.desmos.com/calculator/f4pr0vbsjy?embed" width="500" height="500" style="border: 1px solid #ccc" frameborder=0></iframe>

## Pythagorean identities

{{% div class="example" %}}
Consider one of the triangles with hypotenuse 1 that we've been studying. What does the Pythagorean theorem and the new definition of sine and cosine tell us?
{{% /div %}}

{{% div class="theorem" %}}
If \\(\theta\\) is any angle, we have

\\[ \boxed{\sin^2 \theta + \cos^2 \theta = 1.} \\]
{{% /div %}}

{{% div class="example" %}}
Suppose that \\(\sin \theta = 3/5 \\) and \\(\theta\\) is in the first quadrant. Use the identity to find \\(\cos \theta.\\)
{{% /div %}}

{{% div class="example" %}}
Suppose that \\(\cos \theta = 5/13 \\) and \\(\theta\\) is in the fourth quadrant. Use the identity to find \\(\sin \theta.\\)
{{% /div %}}

{{% div class="example" %}}
Suppose that \\(\cos \theta = 5/13 \\) and \\(\theta\\) is in the fourth quadrant. Find \\(\cot \theta, \sec \theta, \\csc \theta, \\) and \\(\tan \theta.\\)
{{% /div %}}

We can use similar triangles to obtain the identities

\\[\begin{aligned}
\boxed{\tan^2 \theta + 1 = \sec^2 \theta} \newline
\boxed{1 + \cot^2 \theta = \csc^2 \theta} \newline
\end{aligned}\\]

These are collectively known as the *Pythagorean identities.*

{{% div class="example" %}}
Suppose that an angle \\(\theta\\) in the second quadrant has a secant of \\(-13/5.\\) Find \\(\tan \theta.\\)
{{% /div %}}

