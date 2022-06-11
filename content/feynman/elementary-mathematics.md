---
title: Elementary Mathematics
date: 1945-01-01
weight: 1
---

## Equations {#org7dae15c}

The simplest way to solve any equation - except
linear or quadratic equations - is by *trial and error*.



### Example: Interpolation {#org7c76af9}

\\(\frac{1}{1 + x^2} = 2x\\)

\\[\begin{array}{|l|l|l|l|} \mathbf{x} & \textbf{LHS} & \textbf{RHS} &
\textbf{Difference} \\newline 0 & 1 & 0 & 1 \\newline 1 & .5 & 2 & -1.5 \\newline .4 & .862 &
.8 & .062 \\ . \end{array}\\]



### Example: Iteration {#org0da5157}

Solve the equation for \\(x\\).

\\(x = \frac12(1/1 + x^2)\\)

\\[\begin{array}{rl} \textbf{trial } \mathbf{x} & \textbf{result }
\mathbf{x} \newline 0 \to & .5 \newline .5 \swarrow & .4 \newline .4 \swarrow & .431 \newline
\dots \swarrow & \dots \end{array}\\]

If the equation is solved in the form \\(x = \sqrt{\frac1{2x} - 1}\\),
however, the results diverge. If the results do diverge, solving the
equation in the inverse manner{{% sidenote %}}That is to say, inverting the side that is not \\(x.\\){{% /sidenote %}} will make them converge.



### Example: Newton\'s method {#org7b60e6f}

Solve the equation in the form \\(f(x) = 0\\).

Let \\(x_1\\) be the first trial value; then the second trial value is given
by the relation \\(x_2 = x_1 - f(x_1)/f'(x_1)\\). This procedure is
equivalent to extrapolating back along the tangent. If the curve is full
of wiggles things may diverge.

\\[\begin{gathered} f(x) = 1/(1 + x^2) - 2x = 0\\newline f'(x) = -2x/(1 +
x^2)^2 - 2 \end{gathered}\\]

\\[\begin{array}{|l|l|l|} \mathbf{x} & \mathbf{f(x)} & \mathbf{f'(x)} \\newline
0 & 1 & 2 \\newline .5 & 2 & \dots \\newline \dots & \dots & \dots \end{array}\\]



## Problems {#orga98dfd8}



-   Find the first positive root of \\(e^{-x} = \cos x\\) by all three
    methods to 2 decimals. Estimate higher roots.
-   Prove \\(1 + x + x^2 + x^3 + \dots = 1/(1 - x)\\).
-   Sum \\(1 + \alpha \cos \theta + \alpha^2 \cos 2\theta + \alpha^3 \cos
     3\theta + \dots.\\)

<details><summary>Solution</summary>
Assume \(\vert \alpha\vert < 1\). Then we have:

\\[\begin{aligned} \sum_{n = 0}^\infty \alpha^n \cos n\theta &=
\Re\left[\sum_{n = 0}^\infty \alpha^n (\cos n\theta + i \sin
n\theta)\right] \newline &= \Re\left[\sum_{n=0}^\infty \alpha^n e^{in
\theta}\right] \newline &= \Re\left[\sum_{n=0}^\infty (\alpha e^{i\theta})^n
\right] \newline &= \Re\left[\frac1{1 - \alpha e^{i\theta}}\right]\newline &=
\Re\left[\frac1{1 - \alpha \cos\theta - \alpha i\sin\theta}\right]\newline &=
\Re\left[\frac{1 - \alpha \cos\theta + \alpha i\sin\theta}{(1 - \alpha
\cos \theta)^2 - (\alpha i \sin \theta)^2} \right]\newline &= \frac{1 - \alpha
\cos \theta}{(1 - \alpha \cos \theta)^2 + (\alpha \sin \theta)^2} \newline &=
\frac{1 - \alpha \cos \theta}{1 - 2\alpha\cos\theta + \alpha^2}.
\end{aligned}\\]

</details>


## Power Series {#orgfa696fa}





### Summation by Integration and Differentiation {#org3ecc862}


\\[\begin{aligned} 1(x) - \frac12 x^2 + \frac13 x^3 - \frac14 x^4 + \dots
&= S(x) \\newline 1 - x + x^2 - x^3 + x^4 + \dots = S'(x) \\newline S'(x) =
\frac1{1+x}\\newline S(x) = \ln(1 + x) + C \end{aligned}\\]

Evaluate constant for \\(x = 0\\):

\\[\begin{aligned} S(0) &= \ln 1 + C \\newline 0 &= 0 + C \\newline S(1) &= \ln 2
\approx .69315 \end{aligned}\\]



### Convergence: Ratio Test {#orgda02e58}

If the \\(\lim_{m \to \infty} x_{m + 1}/x_m < 1\\) the
series converges.

[^1]: That is to say, inverting the side that is not \\(x\\).
