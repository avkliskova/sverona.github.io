---
title: Inverse trigonometric functions
description: Content from section 8.3 in OpenSTAX.
date: 2021-10-10
---

We've been studying *trigonometric functions* that take an angle (usually measured in radians) and that output a number (a coordinate, a slope, ...) Now we're going to look at those functions' inverses.

*The presentation of this material was adapted from Dr. Molly Dunkum's course notes.*

## Inverse functions review

Before we can talk about inverse *trig* functions, we need to talk more generally about functions.

What does it mean to say that \\(f(x)\\) is a function? If \\((a, b)\\) is a point on the graph, then no other point has \\(a\\) as an x-coordinate. Graphically, this is called the *vertical line test.* (Desmos: show an example of pass and fail.)

Other points on the graph may have \\(b\\) as a y-coordinate. If \\(f(x)\\) is a function and no other points have \\(b\\) as a y-coordinate, then \\(f\\) is called *one-to-one* or *1-1* .  Graphically, \\(f\\) is 1-1 if it passes the *horizontal line test.* (Desmos: show an example of pass and fail.)

If \\(f\\) is 1-1, then its *inverse function* \\(f^{-1}\\) exists. Note: \\(f^{-1}(x) \not= (f(x))^{-1}. \\)

Some facts about inverse functions:
1. The inverse function \\(f^{-1}\\) undoes the function \\(f\\) . That is to say, \\(f^{-1}(f(x)) = x,\\) and \\(f(f^{-1}(x)) = x.\\)
2. The graphs of \\(f\\) and \\(f^{-1}(x)\\) are mirror-images over the line \\(y = x.\\)
3. If \\((x, y)\\) is on the graph of \\(f,\\) then \\((y, x)\\) is on the graph of \\(f^{-1}.\\)
4. The domain of \\(f\\) is the range of \\(f^{-1}.\\) The range of \\(f\\) is the domain of \\(f^{-1}.\\)


## Finding inverse functions
{{% div class="example" %}}
Find the inverse of \\(y = x^3 + 2.\\)
{{% /div %}}

1. Switch \\(x\\) and \\(y\\) : \\(x = y^3 + 2.\\)
2. Now solve for \\(x\\) ... \\(x - 2 = y^3\\) , \\(\boxed{\sqrt[3]{x - 2} = y}.\\)
3. So if \\(f(x) = x^3 + 2,\\) then \\(f^{-1}(x) = \sqrt[3]{x - 2}.\\)


{{% div class="example" %}}
Find the inverse of \\(f(x) = 3x - 2.\\)
{{% /div %}}

1. Write \\(y = f(x)\\) : \\(y = 3x - 2.\\)
2. Switch \\(x\\) and \\(y\\) : \\(x = 3y - 2.\\)
3. Solve for \\(y\\) ... \\(y = \dfrac{x+2}{3}.\\)
4. Write \\(f^{-1}(x) = y\\) : \\(f^{-1}(x) = \dfrac{x +2}{3}.\\)

## Inverse trigonometric functions
The functions we just inverted were 1-1. None of the six trigonometric functions are. (Show!) However, *parts* of them are 1-1, and we can use these parts for the inverse.

### \\(\arcsin x\\)
The inverse function of \\(\sin x\\) is called \\(\sin^{-1}(x)\\) or \\(\arcsin x.\\) The part of \\(\sin x\\) we use is over \\(-\dfrac\pi2 \leq x \leq \dfrac\pi2\\) --- quadrants 1 and 4. So the range of \\(\arcsin x\\) is \\(-\dfrac\pi2 \leq y \leq \dfrac\pi2.\\) The domain of \\(\arcsin x\\) is the range of \\(\sin\\) , which is \\(-1 \leq x \leq 1.\\)

To find \\(\arcsin x\\), we ask: What angle \\(\theta\\) *within the range of* \\( \arcsin \\) has \\(\sin \theta = x\\)? That angle, expressed in radians, is \\(\arcsin x.\\)

{{% div class="example" %}}
Find \\(\arcsin \frac12.\\)
{{%/div%}}
There are two angles with a sine of \\(\frac12\\) : \\(\pi/6\\) and \\(5\pi/6.\\)

However, \\(5\pi/6\\) is out of range. So \\(\arcsin \frac12 = \pi/6.\\)

### \\(\arccos x\\)
For \\(\arccos x,\\) we use the part of \\(\cos x\\) from \\(0 \leq x \leq \pi\\) --- quadrants 1 and 2. So the range of \\(\arccos x\\) is \\(0 \leq y \leq \pi.\\) What's the domain?

{{% div class="example" %}}
Find \\(\arccos 0.\\)
{{% /div %}}

There are two angles with a cosine of \\(0\\) : \\(\pi/2\\) and \\(3\pi/2.\\)

However, \\(3\pi/2\\) is out of range. So \\(\arccos 0 = \pi/2.\\)


### \\(\arctan x\\)
For \\(\arctan x\\), we use the part of \\(\tan x\\) from \\(-\pi/2 \leq x \leq \pi/2.\\)

What are the domain and range of \\(\arctan x\\)?

{{% div class="example" %}}
Find \\(\arctan \sqrt3.\\)
{{% /div %}}

There are two angles with a tangent of \\(\sqrt3:\\) \\(\pi/3\\) and \\(4\pi/3\\) .

But \\(4\pi/3\\) is out of range. So \\(\arctan \sqrt{3} = \pi/3.\\)

Let's do a couple more complex problems...
{{% div class="example" %}}
Find
1. \\(\sin \arccos 3/4.\\)
2. \\(\sin(\arccos 0 - \arcsin 1/2)\\)
{{% /div %}}
