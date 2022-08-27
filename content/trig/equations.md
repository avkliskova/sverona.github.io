---
title: Trigonometric equations
description: Content from OpenSTAX 9.5.
date: 2021-11-05
math: true
---

*Trigonometric equations* are equations in which the "variable" is a trig function, like \\(\sin x\\) or \\(\cos x.\\)

We solve them like we would solve an ordinary equation, except we work with the trig function instead of \\(x.\\) (Think of covering the trig function with a big black square.)

## Linear trig equations

Let's solve \\(2 \sin x + \sqrt{3} = 0\\) for \\(0 \leq x < 2\pi.\\)

First we'll treat \\(\sin x\\) like a big black square and solve for it: \\(2 \sin x = -\sqrt{3}\\), \\(\sin x = -\sqrt{3}/2.\\)

Then we look up the right value on the unit circle to finish: \\(x = 4\pi/3, 5\pi/3.\\) Note that there are two solutions; this is different than when we used inverse trig functions, which can have only one answer.

## Quadratic trig equations

Let's solve \\(4 \sin^2 x - 3 = 0.\\)

All of our usual methods to solve quadratic equations are available to use here. We can either factor, or use the quadratic formula with \\(\sin x\\) as the variable instead of \\(x\\):

\\[\sin x = \frac{0 \pm \sqrt{0^2 - 4 \cdot 4 \cdot (-3)}}{2 \cdot 4}.\\]

We end up with \\(\sin x = \pm \sqrt{3}/2.\\) So \\( \sin x = \pi/3, 2\pi/3, 4\pi/3, 5\pi/3. \\)

## Factoring

Let's solve \\(\sin(2x) - 2 \cos^2(x) = 0\\) on \\(0 \leq x < 2\pi.\\)

First, write \\(\sin(2x) = 2 \sin x \cos x.\\) Then we can factor the equation as

\\[2 (\cos x)(\sin x - \cos x) = 0.\\]
This gives \\(\cos x = 0\\), \\(\sin x - \cos x = 0.\\)

## Using identities

Let's solve \\(\tan x = 2 \sin x\\) on \\(0 \leq x < 2\pi.\\)

First, write \\(\tan x - 2 \sin x = 0.\\)

Then write \\(\tan x = \dfrac{\sin x}{\cos x}\\): \\(\dfrac{\sin x}{\cos x} - 2 \sin x = 0.\\)

Factor out a \\(\sin x\\): \\((\sin x)\left(\dfrac{1}{\cos x} - 2\right) = 0.\\) Note that we do NOT divide out the \\(\sin x.\\)

Set factors to zero: \\(\sin x = 0\\) or \\(\dfrac{1}{\cos x} - 2 = 0.\\)

This gives \\(x = 0, \pi, \pi/6, 11\pi/6.\\)
