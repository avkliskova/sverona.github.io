---
title: The tangent and secant curves
description: Content from section 8.2 in OpenSTAX.
date: 2021-10-05
math: true
---

<style type="text/css">
.small {
  font-size: smaller;
}
</style>

## What we know already

The graphs of sine or cosine make *waves*, like this:

[Desmos]

These graphs can have horizontal and vertical *shifts*, *squishes*, *stretches*, and/or *flips.*

Some of these have special names. We call horizontal shifts *phase shifts.* A horizontal squish or stretch is a change in the *period.* A vertical stretch or squish is a change in the *amplitude.*

Given a generic sine or cosine function \\(f(x) = A \sin(Bx + C) + D\\), we can determine the period as \\(\dfrac{2\pi}{|B|},\\) the phase shift as \\(\dfrac{-C}{B}\\), and the amplitude as \\(|A|.\\)

## Values of tangent and secant

Let's plot these.

Where is tangent undefined? Where is tangent zero? What about cotangent?

Where is secant undefined? Does it ever reach zero? What about cosecant?

Let's look at a graph. Where do tangent and secant and cotangent and cosecant have *asymptotes*?

What do you notice about the values of sine, tangent, and secant in the first quadrant versus the values of cosine, cotangent, and cosecant in the second quadrant?


## Tangent curves

What period does the tangent have?

Tangents and cotangents don't have amplitudes. We call the relevant bit the *stretch factor.* Other than that, all the rules are exactly the same.

To wit, if I have \\(f(x) = A \tan(Bx + C) + D\\), I can determine the period as \\(\dfrac{\pi}{|B|},\\) the phase shift as \\(\dfrac{-C}{B}\\), and the *vertical stretch factor* as \\(|A|\\).

Where does this transformed function have asymptotes?

## Secant curves

What period does the secant have?

Secants don't have amplitudes either.

To wit, if I have \\(f(x) = A \sec(Bx + C) + D\\), I can determine the period as \\(\dfrac{2\pi}{|B|},\\) the phase shift as \\(\dfrac{-C}{B}\\), and the *vertical stretch factor* as \\(|A|\\).

Where does this transformed function have asymptotes?

## Examples

Find the period, stretch factor, the phase shift, the midline, the range, and the asymptotes over one period.

1. \\(2 \tan(3x + \pi) - 2\\)
2. \\(2 \sec(x/4 - \pi/4) + 1\\)

## Summary

Here is everything you'll need to know about the six trig functions.

Untransformed:

{{% div class="fullwidth" %}}
| Function | Period | Phase shift | Amplitude or<br />stretch factor | Midline | Range | Asymptotes<br />(over one period) |
|----------|--------|-------------|-----------------------------|---------|-------|------------|
\\(\sin x\\) | \\(2\pi\\) | \\(0\\) | \\(1\\) | \\(y = 0\\) | \\(-1 \leq y \leq 1\\) | none |
\\(\cos x\\) | \\(2\pi\\) | \\(0\\) | \\(1\\) | \\(y = 0\\) | \\(-1 \leq y \leq 1\\) | none |
\\(\tan x\\) | \\(\pi\\) | \\(0\\) | \\(1\\) | \\(y = 0\\) | all real numbers | \\(x = \pi/2\\)|
\\(\cot x\\) | \\(\pi\\) | \\(0\\) | \\(1\\) | \\(y = 0\\) | all real numbers | \\(x = 0\\)|
\\(\sec x\\) | \\(2\pi\\) | \\(0\\) | \\(1\\) | \\(y = 0\\) | \\(y \leq -1, y \geq 1\\) | \\(x = \pi/2\newline x = 3\pi/2\\) |
\\(\csc x\\) | \\(2\pi\\) | \\(0\\) | \\(1\\) | \\(y = 0\\) | \\(y \leq -1, y \geq 1\\) | \\(x = 0\newline x = \pi\\)  |
{{% /div %}}

Transformed:
{{% div class="fullwidth small" %}}
| Function | Period | Phase shift | Amplitude or<br />stretch factor | Midline | Range | Asymptotes<br />(over one period) |
|----------|--------|-------------|-----------------------------|---------|-------|------------|
\\(A \sin(Bx + C) + D,\newline A\cos(Bx + C) + D\\) | \\(\dfrac{2\pi}{\|B\|}\\) | \\(\dfrac{-C}{B}\\) | \\(\|A\|\\) | \\(y = D\\) | \\(D - \|A\| \leq y \leq D + \|A\|\\) | none |
\\(A \tan(Bx + C) + D\\) | \\(\dfrac{\pi}{\|B\|}\\) | \\(\dfrac{-C}{B}\\) | \\(\|A\|\\) | \\(y = D\\) | all real numbers | \\(x = \dfrac{\pi/2 - C}{B}\\) |
\\(A \cot(Bx + C) + D\\) | \\(\dfrac{\pi}{\|B\|}\\) | \\(\dfrac{-C}{B}\\) | \\(\|A\|\\) | \\(y = D\\) | all real numbers | \\(x = \dfrac{-C}{B}\\) |
\\(A \sec(Bx + C) + D\\) | \\(\dfrac{2\pi}{\|B\|}\\) | \\(\dfrac{-C}{B}\\) | \\(\|A\|\\) | \\(y = D\\) | \\(y \leq D - \|A\|,\newline y\geq D + \|A\|\\)| \\(x = \dfrac{\pi/2-C}{B},\newline x=\dfrac{3\pi/2 - C}{B}\\) |
\\(A \csc(Bx + C) + D\\) | \\(\dfrac{2\pi}{\|B\|}\\) | \\(\dfrac{-C}{B}\\) | \\(\|A\|\\) | \\(y = D\\) | \\(y \leq D - \|A\|,\newline y\geq D + \|A\|\\)| \\(x = \dfrac{-C}{B},\newline x=\dfrac{\pi - C}{B}\\) |
{{% /div %}}

How can we get to the other asymptotes from these two?
