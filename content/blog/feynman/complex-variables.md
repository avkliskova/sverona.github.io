---
title: Complex Variables
date: 1946-10-28
---

## General Review

Let \\(A = a + bi\\) and \\(B = c + di.\\) Then the *rule
of addition* states \\[A + B = (a + c) + i(b + d),\\] and the *rule of
multiplication* states \\[AB = (ac - bd) + i(ad + bc).\\]

{{% figure class="marginfigure" src="/images/argand.png" caption="An Argand diagram showing the complex number \\(a + ib\\) as a vector." %}}

A complex number may also be represented as follows.

\\[\begin{gathered}
A = (a + bi) = \sqrt{a^2+b^2} \left[\frac{a}{\sqrt{a^2+b^2}} + \frac{bi}{\sqrt{a^2+b^2}}\right] \newline
A = r(\cos \theta + i \sin \theta)
\end{gathered}\\]

\\[\begin{equation}
AB = r r' (\cos(\theta + \theta') + i \sin(\theta + \theta')) \tag{2}
\end{equation}\\]

\\[\begin{equation*}
A^n = r^n (\cos(n\theta) + i \sin(n\theta))
\end{equation*}\\]

Suppose we let \\(r\\) & \\(r'\\) in equation (2) equal unity.{{% sidenote %}}That is to say, set \\(r = r' = 1.\\){{% /sidenote %}} We have an equation of the type:

\\[ f(\theta) f(\theta') = f(\theta + \theta').\\]

This functional equation is solved by

\\[\begin{aligned}
f(\theta) &= R^\theta \newline
R^\theta R^{\theta'} &= R^{\theta + \theta'} \newline
R^\theta &= \cos \theta + i \sin \theta
\end{aligned}\\]

We have in addition:

\\[\begin{aligned}
R^\theta \cdot \bar{R}^\theta &= 1 \newline
R \cdot \bar{R} &= 1 \newline
R &= 1/\bar{R}
\end{aligned}\\]

This condition is satisfied{{%sidenote%}}
Because if \\(e^i = a + bi\\), we must have
\\[\begin{equation*}\overline{e^i} = a - bi = e^{-i}.\end{equation*}\\]
The astute reader will note that this also works for any other base
in place of \\(e.\\) The simplest way to establish that the base is in
fact \\(e\\) is to note that \\(f'(\theta) = if(\theta).\\)
{{%/sidenote%}} if \\(R = e^i.\\)

\\[\begin{equation}
e^{i\theta} = \cos \theta + i \sin \theta \tag{3}
\end{equation}\\]

This equation may be used as the defining equation for \\(e.\\) Note that
\\(e^{i\theta}\\) has period \\(2\pi.\\)


From equation (3), we learn:

\\[\begin{aligned}
e^{i\pi a'} + 1 &= 0, &a' = 1, 3, 5, \dots\newline
e^{i 2\pi a} - 1 &= 0, &a = 0, 1, 2, \dots
\end{aligned}\\]

### \\(n\\)th Roots of Unity

\\[ \sqrt[n]{1} = (e^{i2\pi a})^{1/n} \\]

There will be \\(n\\) distinct roots corresponding to values of \\(a\\) from \\(0\\)
to \\(n - 1.\\)

### Logarithm of a Complex Number

\\[\begin{aligned}
\ln(a + bi) &= \ln(re^{i\theta}) \newline
&= \ln r + i\theta \newline
&= \ln \sqrt{a^2 + b^2} + i \arctan \frac{b}{a} \newline
&= \ln \sqrt{a^2 + b^2} + i \arctan \frac{b}{a} + 2\pi k, \qquad k = 1, 2, 3, \dots
\end{aligned}\\]

The logarithm of a complex number is a many-valued function.

## Exercises

Prove \\(\ln(-1) = i\pi.\\)

## Conformal Mapping

The equation \\(W = f(Z)\\) establishes a relation between the points of the
\\(W\\) and \\(Z\\) planes. By using such a relation it is possible to map a
region of the \\(Z\\) plane into a region of the \\(W\\) plane. If in this
process neighborhoods go into neighborhoods the mapping is said to be
continuous. Points at which this is not true are called singularities.

Let us examine a few such maps.

1.  \\(W = aZ\\)

    Multiplication by a real number equals a change of scale.

2.  \\(W = e^{i\theta}Z\\)

    Multiplication by \\(e^{i\theta}\\) equals a positive rotation through
    the angle \\(\theta.\\)

3.  Multiplication by a complex number \\(A = re^{i\theta}\\) equals a scale
    change by \\(r\\) and a rotation through the angle \\(\theta.\\)

4.  Addition of a complex number \\(\beta\\) equals a translation by
    displacement \\(\beta.\\)

5.  \\(W = \bar{Z}\\) equals a reflection on the real axis.

Consider the function:

\\[W = \dfrac1Z\\]

This corresponds to an inversion and reflection on the axis of reals. A
pure inversion is represented by \\(W = 1/\bar{Z}.\\)

{{% div class="fullwidth flex" %}}
{{% figure src="/images/inversion.png" caption="\\(Z\\) depicted with the unit circle and some lines." %}}
{{% figure src="/images/inversion2.png" caption="\\(W = 1/Z.\\)" %}}
{{% /div %}}

The function \\(1/Z\\) is said to have a \"simple pole\" at the origin.

Consider the function \\(W = Z^2.\\)

\\[\begin{aligned}
   Z &= re^{i\theta} \newline
   Z^2 &= r^2 e^{2i\theta}
  \end{aligned}\\]

{{% div class="fullwidth flex" %}}
{{% figure src="/images/pre-parabola.png" caption="\\(Z.\\)" %}}
{{% figure src="/images/parabola.png" caption="\\(W = Z^2.\\)" %}}
{{% /div %}}

### Analytic Treatment

\\[\begin{aligned}
Z &= 1 + iy \newline
Z^2 &= 1 - y^2 + 2iy \newline
u &= 1 - y^2 \qquad v = 2y \newline
u &= 1 - \frac{v^2}4
\end{aligned}\\]

Let\'s see what happens as we circle the origin.

\[Figures.\]

We observe that in circling the origin of the \\(Z\\) plane once, we circle
the origin of the \\(W\\) plane twice.

Consider the inverse map:

\\[\begin{aligned}
W &= Z^{1/2} \newline
&= r^{1/2} e^{i\theta/2}
\end{aligned}\\]

[ Figures ]

In this case, if we circle the origin of the \\(Z\\) plane once, we only get halfway around the origin of the \\(W\\) plane. This is a consequence of the fact that we have neglected the negative root of \\(Z^{1/2}.\\) The origin has in this case turned into a branch point.

## Branch Points

A branch point in the \\(Z\\) plane is a point which if it is circled once defines a curve in the \\(W\\) plane which does not close on itself. In order to keep track of the roots of functions having branch points, we draw an imaginary line, called the branch line, from the branch point to infinity. This line has the property that every crossing defines a change in the root being considered. The way in which a branch line operates is best pictured geometrically. We imagine the \\(Z\\) plane made of as many layers of paper as the function has roots. These layers are joined in such a way that in profile they look like this:

[Figures.]

The intersections are the branch lines. The rule is that whenever one is on a given layer, one uses the root associated with that layer.

[Figures.]

## Branch Lines

Consider the function \\(W = \frac1{\sqrt{Z^2 - 1}}.\\) This function has branch points at \\(\pm 1\\). The branch lines may be represented in either of two ways.

[Figures.]

If we imagine that the branch lines in figure 1 join at infinity, it is easy to see that the two representations are equivalent, since the branch line may "blow in the wind," as it were.

### The Logarithm \\(W = \ln Z = \ln r + i\theta\\)

[ Figures. ]

The logarithm has a branch point at the origin, and has infinitely many branches.

### The derivative

\\[
\frac{\mathrm d f(z)}{\mathrm dz} = \lim\_{\Delta z \to 0} \frac{f(z + \Delta z) - f(z)}{\Delta z}
\\]

In general, the value of the derivative will depend on the way in which \\(\Delta z\\) approaches zero. We illustrate this by one example:

\\[\begin{aligned}
z &= x + iy \newline
f(z) = \overline z &= x - iy
\\end{aligned}\\]

\\[\begin{aligned}
\frac{\mathrm df}{\mathrm dz} &= \lim\_{\Delta z \to 0} \frac{[(x + \Delta x) - i(y + \Delta y)] - (x - iy)}{\Delta x + i \Delta y} \newline
&= \lim\_{\Delta z \to 0} \frac{\Delta x - i \Delta y}{\Delta x + i \Delta y}
\end{aligned}\\]

If we let \\(\Delta x,\\) then \\(\Delta y,\\) go to zero, \\(\mathrm df /\mathrm dz = -1.\\) If we let \\( \Delta y,\\) then \\( \Delta x,\\) go to zero, \\(\mathrm df / \mathrm dz = 1.\\)

We see that the value of the derivative depends on the path by which \\(\Delta z \to 0.\\)

### Analytic Functions of a Complex Variable

An analytic function of a complex variable is loosely defined as one whose derivative is independent of the path by which \\(\Delta z \to 0.\\) Let us examine the conditions which must hold if this is to be the case.

\\[\begin{aligned}
f(x + iy) &= u + iv \newline
(\Delta y \to 0) \qquad \frac{\mathrm df}{\mathrm dz} = \frac{\partial f}{\partial x} &= \frac{\partial u}{\partial x} + i \frac{\partial v}{\partial x} \newline
(\Delta x \to 0) \qquad \frac{\mathrm df}{\mathrm dz} = \frac1i \frac{\partial f}{\partial y} &= \frac1i \left[\frac{\partial u}{\partial y} + i \frac{\partial v}{\partial y}\right].
\end{aligned}\\]

If \\(\frac{\mathrm df}{\mathrm dz}\\) is to be independent of the path by which \\(\Delta z \to 0,\\) these two expressions for the derivative must be equal.

\\[
\frac{\partial u}{\partial x} + i\frac{\partial v}{\partial x} = -i \frac{\partial u}{\partial y} + \frac{\partial v}{\partial y}
\\]

Hence:
\\[\begin{aligned}
\frac{\partial u}{\partial x} &= \frac{\partial v}{\partial y}\newline
\frac{\partial v}{\partial x} &= -\frac{\partial u}{\partial y}\newline
\end{aligned}\\]

The above equations imply preservation of angle:

\\[\begin{aligned}
\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} &= 0 \newline
\frac{\partial^2 v}{\partial x^2} + \frac{\partial^2 v}{\partial y^2} &= 0 
\end{aligned}\\]

These are simply Laplace equations in two dimensions. We can see that analytic functions of a complex variable may be used in the solution of physical problems where the two-dimensional Laplace equation holds.

### Integral of a Complex Function

\\[\int\_{z\_1}^{z\_2} f(z) ~\mathrm dz = \lim\_{\Delta z \to 0} \sum f(z) \Delta z\\]

This integral will, in general, depend on the path of integration. Let's examine the conditions under which the integral will be independent of the path of integration.  

\\[\int f(z) ~\mathrm dz = \int (u ~\mathrm dx - v ~\mathrm dy) + i \int (v ~\mathrm dx + u ~\mathrm dy) \\]

The integrals on the right will be independent of path if the integrands are exact differentials:

\\[\begin{aligned}
u ~\mathrm dx - v ~\mathrm dy &= \mathrm df = \frac{\partial f}{\partial x} ~\mathrm dx + \frac{\partial f}{\partial y} ~\mathrm dy \newline
& u = \frac{\partial f}{\partial x}; \qquad v = \frac{\partial f}{\partial y}
\end{aligned}\\]

Hence: \\[ \frac{ \partial u }{\partial y} = - \frac{\partial v}{\partial x}; \qquad \frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}. \\]

These are simply the equations which hold if \\(f(z)\\) is analytic.

The line integral of an analytic function around any closed curve is zero, *provided* there are no singularities included by the curve.
  
### Example of a Contour Integral

We integrate the function \\(W = \overline Z\\) around the contour consisting of the portion of a circle in the first quadrant:

1. \\(\overline Z = x\\); \\[ \int_0^a x ~\mathrm dx = \frac{a^2}2 \\]
2. \\(\overline Z = ae^{-i\theta}\\); \\(Z = ae^{i \theta}\\); \\(\mathrm dZ = iae^{i\theta} ~\mathrm d\theta\\); \\[
\int_0^{\pi/2} ae^{-i\theta} \cdot ia e^{i\theta} ~\mathrm d\theta = \frac{ia^2\pi}2
\\]
3. \\(\overline Z = -iy \\); \\[ \int_a^0 (-iy) i ~\mathrm dy = -\frac{a^2}2 \\]

\\[\oint \overline Z ~\mathrm dZ = i \frac{a^2\pi}2\\]

## Problems
1. Describe the following functions.
    1. \\(\arctan Z\\)
    2. \\(\tanh Z\\)
    3. \\(\displaystyle \frac{1}{\sqrt{Z^2 - 1}}\\)
    4. \\( \sin Z\\)

  Where are the singularities, and what kind are they?

2. Investigate the value of \\(\mathrm df / \mathrm dz\\) for \\(f(z) = \overline z\\) for paths of constant \\(\theta.\\)

3. Integrate \\(W = Z^2\\) around the same contour used in the first example.
