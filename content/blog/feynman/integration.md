---
title: Integration
date: 1945-01-01
weight: 3
---

## Methods 

1.  Substitution
2.  By parts
3.  Differentiation of a parameter
4.  Series expansion
5.  Contour integration
6.  Numerical methods
7.  Special tricks

Methods 3 to 7 are applicable particularly to definite integrals.



## Complex Variable in Substitution 

Find \\(\int_0^\infty e^{-ax} \cos bx ~dx.\\)

Since \\(\cos bx = (e^{ibx} + e^{-ibx})/2\\), we have

\\[\begin{aligned} \int_0^\infty e^{-ax} \cos bx &= \frac12 \int_0^\infty
e^{-(a - ib)x} ~dx + \frac12 \int_0^\infty e^{-(a + ib)x} ~dx \newline &=
\frac12 \left( \frac1{a - ib} + \frac1{a + ib} \right) \newline &=
\frac{a}{a^2 + b^2} \end{aligned}\\]



## Differentiation of a Parameter 

Find
\\(\displaystyle \int_0^\infty xe^{-ax} \cos bx ~dx.\\)

Define \\(\displaystyle S(a) = \int_0^\infty e^{-ax} \cos bx ~dx = \frac{a}{a^2 + b^2}.\\)

Differentiate with respect to \\(a\\):

\\[ S'(a) = -\int_0^\infty xe^{-ax} \cos bx = \frac{b^2 - a^2}{(a^2 +
b^2)^2} \\]

The general rule for differentiation with respect to a parameter is
\\[\begin{aligned}\frac{d}{d\alpha} \left[
\int_{x_1(\alpha)}^{x_2(\alpha)} f(x, \alpha) ~dx\right] &=
\int_{x_1}^{x_2} \frac{\partial}{\partial\alpha} f(x, \alpha) ~dx \newline &+
\left[\frac{d}{d\alpha} x_2(\alpha)\right]\cdot f(x_2, \alpha) -
\left[\frac{d}{d\alpha} x_1(\alpha)\right]\cdot f(x_1, \alpha)\end{aligned}\\]

\\[\begin{aligned} \Delta \int_{x_1}^{x_2} f(x, \alpha) ~dx &=
\int_{x_1}^{x_2} \Delta f(x, \alpha) ~dx \newline &+ \Delta x_2(\alpha) f(x_2,
\alpha) - \Delta x_1(\alpha) f(x, \alpha) \end{aligned} \\]



## Multiplication by a Factor 

Find
\\(\displaystyle \int_0^\infty \frac{\sin x}x ~dx.\\)

\\[\begin{aligned} S(\alpha) &= \int_0^\infty e^{-ax} \frac{\sin x}x ~dx
\newline S'(\alpha) &= -\int_0^\infty e^{-ax} \sin x ~dx = \frac{-1}{1 +
\alpha^2} \newline S(\alpha) &= -\arctan \alpha + C \newline \lim_{\alpha \to
\infty} S(\alpha) &= 0 = -\frac\pi{2} + C \newline S(\alpha) &= \frac\pi{2} -
\arctan \alpha \newline S(0) &= \frac\pi{2} \end{aligned}\\]



## Differentiation under an Integral Sign 


\\[\begin{aligned} \int_0^\infty e^{-ax} (1 + x^2)^{-1} ~dx &= S(a) \newline
\int_0^\infty x^2 e^{-ax} (1 + x^2)^{-1} ~dx &= S''(a) \end{aligned}\\]

\\[\begin{aligned} S(a) + S''(a) &= \int_0^\infty \left(\frac1{1 + x^2} +
\frac{x^2}{1 + x^2}\right) e^{-ax} ~dx \newline \frac{d^2S}{da^2} + S &=
\frac1a \end{aligned}\\]

This differential equation may be solved for \\(S(a)\\).



### Partial Differentiation 


\\[\begin{aligned} S(\alpha, \beta) &= \int_0^\infty e^{-\alpha x} \sin
\beta x ~dx \newline \frac{\partial^2 S}{\partial \beta^2} &= -\int_0^\infty
x^2 e^{-\alpha x} \sin \beta x ~dx \newline \frac{\partial^2 S}{\partial
\alpha^2} &= \int_0^\infty x^2 e^{-\alpha x} \sin \beta x ~dx \newline
\frac{\partial^2 S}{\partial \beta^2} &= - \frac{\partial^2 S}{\partial
\alpha^2} \end{aligned}\\]

The form of \\(S\\) may be partly determined by making the substitution
\\(y = \beta x\\).

\\[\begin{aligned} S(\alpha, \beta) &= \frac1\beta \int_0^\infty
e^{-\frac\alpha\beta y} \sin y ~dy = \frac1\beta
F\left(\frac\alpha\beta\right)\newline \frac\partial{\partial\beta} \left[
\frac1\beta F\left(\alpha\beta\right) \right] &= \frac1\beta
F'\left(-\frac\alpha{\beta^2}\right) -
\frac{F\left(\frac\alpha\beta\right)}{\beta^2} \newline
\frac{\partial^2}{\partial\beta^2}\left[\frac1\beta
F\left(\alpha\beta\right)\right] &= -\frac{\alpha}{\beta^3}
F''\left(-\frac{\alpha}{\beta^2}\right) +
F'\left(\frac\alpha\beta\right)\frac{3\alpha}{\beta^4} \newline &+
F\left(\frac\alpha\beta\right) \frac2{\beta^3} -
\frac1{\beta^2}F'\left(-\frac{\alpha}{\beta^2}\right) \newline \newline
\frac{\partial^2S}{\partial\beta^2} &= \frac2{\beta^3}F +
\frac{4\alpha}{\beta^4}F' + \frac{\alpha^2}{\beta^5}F'' \newline
\frac{\partial^2S}{\partial\alpha^2} &= \frac1{\beta^3}F''
\end{aligned}\\]

Multiply through by \\(\beta^3\\) and let \\(z = \frac{\alpha}{\beta}\\).{{%sidenote%}}
The original has \\(\frac{d}{dx}\\) for \\(\frac{d}{dz}\\) in what follows.
{{%/sidenote%}}


\\[\begin{aligned} 2F + 4zF' + z^2F'' &= -F'' \newline \frac{d}{dz}(z^2F') +
2\frac{d}{dz}(zF) &= -F'' \newline z^2F' + 2zF &= -F' + C_1 \newline
\frac{d}{dz}(z^2F) &= -F' + C_1 \newline z^2F &= -F + C_1z + C_0 \newline
\end{aligned}\\]

\\[\begin{aligned} F &= \frac{C_0 + C_1z}{1 + z^2}\newline S(\alpha, \beta) &=
\frac1\beta F = \frac{C_0\beta + C_1\alpha}{\alpha^2 + \beta^2}
\end{aligned}\\]

To evaluate \\(c_0\\) and \\(c_1\\), we observe:

\\[ S(\alpha, 0) = 0 = \frac{C_1\alpha}{\alpha_2} \quad\therefore C_1 = 0
\\]

For small \\(\beta\\), \\(\sin \beta x \sim \beta x\\). This is a good
approximation since \\(e^{-\alpha x}\\) kills the integrand for large \\(x\\).

\\[\begin{aligned} \int_0^\infty e^{-\alpha x} \beta x ~dx &=
\frac\beta{\alpha^2} \newline \frac{C_0\beta}{\alpha^2 + \beta^2} &\cong
\frac{C_0\beta}{\alpha^2} \quad\therefore C_0 = 1 \end{aligned}\\]

\\[ S(\alpha, \beta) = \frac\beta{\alpha^2 + \beta^2} \\]



## The Dirac Delta Function 

\\(\delta(x) = 0\\), \\(x \not= 0\\), and is in some way
infinite for \\(x = 0\\).{{% sidenote %}} The reference for this section is *The Principles of Quantum Mechanics*, P. M. Dirac.{{% /sidenote %}}

\\[\begin{gathered} \int_{-\infty}^\infty \delta(x) ~dx \vcentcolon=
\int_{-\epsilon}^{\epsilon} \delta(x) ~dx \vcentcolon= 1 \newline
\int_{-\infty}^\infty f(x) \delta(x) ~dx = f(0) \end{gathered}\\]

Proof:

Write \\[\displaystyle \int_{-\infty}^\infty f(x) \delta(x) ~dx =
\int_{-\infty}^{-\epsilon} f(x) \delta(x) ~dx +
\int_{-\epsilon}^\epsilon f(x) \delta(x) ~dx + \int_\epsilon^\infty f(x)
\delta(x) ~dx. \\]

If \\(f(x)\\) varies relatively slowly in the range \\([-\varepsilon,
\varepsilon]\\), we can replace it by an average of \\(f(x)\\) over that
interval.

\\[\begin{aligned} \int_{-\infty}^\infty f(x) \delta(x) ~dx &=
\int_{-\epsilon}^\epsilon f(x) \delta(x) ~dx \newline &=
\int_{-\epsilon}^\epsilon \overline{f(x)} \delta(x) ~dx \newline &=
\overline{f(x)} \cdot \mathbf{1}_{x = 0} \cdot \int_{-\epsilon}^\epsilon
\delta(x) ~dx \newline \left(\lim_{\epsilon \to 0}\right) \quad &= f(0).
\end{aligned}\\]

The delta function is useful since it may be operated on as though it
were a real function. The only justification we give for this is that it
gives the correct answer.

\\[\begin{aligned} f'(t) &= -\int_{-\infty}^\infty f(x) \delta'(x - t)
~dx \newline &= \left. f(x) \delta(x - t) \right\vert_{x=-\infty}^{x=\infty} -
\int_{-\infty}^\infty f'(x) \delta(x - t) ~dx \newline &= f'(t).
\end{aligned}\\]

The following useful relations may be easily proved:

1.  \\(\delta(x) = \delta(-x)\\)
2.  \\(\delta'(x) = -\delta'(-x)\\)
3.  \\(x \delta(x) \equiv 0 \\)
4.  \\(x\delta'(x) = -\delta(x)\\)
5.  \\(\delta(ax) = \frac1{\vert a\vert} \delta(x)\\)
6.  \\(f(x)\delta(x - a) = f(a)\delta(x - a)\\)

The following figures are approximate representations of \\(\delta(x)\\) and
\\(\delta'(x)\\).

Define the *step function*{{%sidenote%}}
There are differing definitions of the value at \\(x = 0\\). The definition of \\(\delta(x)\\) as the limit \\(\sigma \to 0\\) of the normal distribution suggests the value should be \\(1/2\\), but some authors define it as \\(1\\).
{{%/sidenote %}} \\(\displaystyle H(x) = \int_{-\infty}^x
\delta(x) ~dx = \begin{cases} 0, &x < 0,\newline 1, &x >0.\end{cases}\\)

Consider the piecewise smooth curve above. Its derivative may be
expressed in terms of the delta function as \\(f'(x)_{x \not= a} +
c\delta(x - a).\\)

Consider the integral \\(\int_{-\infty}^\infty \cos \beta x ~dx\\). We shall
show that it is equal to \\(2\pi \delta(\beta)\\) by showing
\\[\int_0^\infty \cos \beta x ~dx = \pi \delta(\beta). \\]

Note{{% sidenote %}} You may argue here that we haven\'t shown that this limit is actually equal to some multiple of \\(\delta(\beta)\\). You\'d be correct to do so. The fact Feynman is implicitly using here is that the Dirac delta is the limit of a Cauchy distribution as the scale parameter goes to \\(0\\). In fact, Cauchy defined the delta this way 100 years before Dirac!{{%/sidenote%}} \\(\displaystyle\lim_{\alpha \to 0} e^{-\alpha x} \cos \beta x ~dx =
\lim_{\alpha \to 0} \frac\alpha{\alpha^2 + \beta^2}.\\)

![Figure 5: The Cauchy distribution for small
\\(\gamma\\).](figs/cauchydist.png)

For small \\(\alpha\\) this integral looks approximately as above. The area
under the curve is $A = \int_{-\infty}^\infty
\frac\alpha{\alpha^2+\beta^2} ~d\beta.$

Making the change of variables \\(\beta = \alpha z\\), we obtain

\\[\begin{aligned} A &= \int_{-\infty}^\infty \frac{\alpha^2}{\alpha^2 +
\alpha^2 z^2} ~dz \newline &= \int_{-\infty}^\infty \frac{dz}{1 + z^2} \newline &=
\arctan z \vert_{-\infty}^\infty \newline &= \pi. \end{aligned}\\]

Note that the area is independent of the value of \\(\alpha.\\){{%sidenote%}}
And thus \\(A\\) is equal to the multiple of \\(\delta(\beta)\\) whose integral over the real line is \\(\pi,\\) which is \\(\pi \delta(\beta).\\){{%/sidenote%}}




### Example: Use of the delta function in evaluating a definite integral 

\\[\int_0^{\pi/2} \cos(m \tan\theta) ~d\theta \\]

Substitute \\(\tan \theta = x\\).

\\[\begin{aligned} \int_0^\infty \cos mx ~\frac{dx}{1 + x^2} &= S(m) \newline
-\int_0^\infty x^2 \cos mx ~\frac{dx}{1 + x^2} &= S''(m) \newline
\end{aligned}\\]

\\[S(m) - S''(m) = \int_0^\infty \cos mx ~dx = \pi \delta(m)\\]

### Aside: Variation of parameters

This is a perfectly general method for solving inhomogeneous
differential equations. It shows up in any undergraduate course, but
this example begs for more details here, so let\'s go through it now.

In fact, let\'s solve the more general equation \\(S''(m) - S(m) = f(m)\\).
First, we find the homogeneous solutions \\(h_1(m) = e^m\\), \\(h_2(m) =
e^{-m}.\\) These are so named because they solve the *homogeneous
equation* \\(S''(m) - S(m) = 0.\\)

Now let\'s assume the solution is given by{{% sidenote %}}
This is why the method is called *variation of parameters*; the \"parameters\" are the \"coefficients\" on \\(h_1\\) and \\(h_2\\), which would be constants were this equation homogeneous; but we\'ve just made them variables.
{{% /sidenote %}} \\[S(m) =
s_1(m)h_1(m) + s_2(m)h_2(m) \\] and further assume{{% sidenote %}}
Yes, there is a valid reason we can make all these assumptions; it has to do with something called *differential algebra*, which explains how the derivative acts as a linear operator on a function space. {{% /sidenote %}} \\[0 = s_1'(m)h_1(m) + s_2'(m)h_2(m). \\]

If we differentiate the foregoing equation, we get \\[\begin{aligned}
S'(m) &= s_1'(m)h_1(m) + s_1(m)h_1'(m) \newline &\quad + s_2'(m)h_2(m) +
s_2(m)h_2'(m) \newline &=s_1(m)h_1'(m) + s_2(m)h_2'(m). \end{aligned}\\]

If we do it again, we get

\\[\begin{aligned} S''(m) &= s_1'(m) h_1'(m) + s_1(m) h_1''(m) \newline &\quad+
s_2'(m) h_2'(m) + s_2(m) h_2''(m). \end{aligned}\\]

Now we have \\[\begin{aligned} f(m) = S''(m) - S(m) &= s_1'(m)h_1'(m) +
s_1(m)h_1''(m) \newline &\quad + s_2'(m)h_2'(m) + s_2(m)h_2''(m) \newline &\quad -
s_1(m)h_1(m) - s_2(m)h_2(m) \newline &= s_1'(m)h_1'(m) + s_2'(m)h_2'(m).
\end{aligned}\\]

Thus we obtain the system of equations{{% sidenote %}}
This trick of \"constructing \\(f(m)\\)\" is the key step here; it goes through regardless of what the original equation was.  Everything after this is problem-specific.
{{% /sidenote %}}


\\[\begin{bmatrix} h_1(m) & h_2(m) \newline h_1'(m) & h_2'(m) \end{bmatrix}
\begin{bmatrix} s_1'(m) \newline s_2'(m) \end{bmatrix} = \begin{bmatrix} 0 \newline
f(m)\end{bmatrix}\\]

In our case, this becomes

\\[\begin{aligned} e^m s_1'(m) + e^{-m} s_2'(m) &= 0, \newline e^ms_1'(m) -
e^{-m} s_2'(m) &= -\pi\delta(m),\end{aligned} \\]

which gives \\(2e^m s_1'(m) = -\pi \delta(m)\\), $2e^{-m}s_2'(m) =
\pi\delta(m)$, so we have

\\[\begin{aligned} s_1(m) &= -\frac\pi2 \int e^{-m} \delta(m) ~dm \newline &=
-\frac\pi2 e^{-0}H(m) + A, \newline s_2(m) &= \frac\pi2 \int e^m \delta(m) ~dm
\newline &= \frac\pi2 e^0H(m) + B. \end{aligned}\\]

Thus the solution is given by

\\[\begin{aligned} S(m) &= \left(-\frac\pi2 H(m) + A\right) e^m +
\left(\frac\pi2 H(m) + B\right)e^{-m} \newline &= \frac\pi2 H(m) (-e^m +
e^{-m}) + Ae^m + Be^{-m}, \end{aligned}\\]

which agrees with what is given below.

### Example continued

The general solution of such a differential equation is{{% sidenote %}}
Obtained by variation of parameters.
{{% /sidenote %}}

\\[\displaystyle S(m) = \frac{e^m}2 \int_{-\infty}^m e^{-t} f(t) ~dt -
\frac{e^{-m}}2\int_{-\infty}^m e^t f(t) ~dt + Ae^m + Be^{-m}\\]

where \\(f(t) = \pi \delta(t)\\).

Therefore the solution has the form

\\[S(m) = \begin{cases}Ae^m + Be^{-m}, &m < 0, \newline Ae^m + Be^{-m} -
\frac\pi2 e^m + \frac\pi2 e^{-m}, &m > 0,\end{cases}\\]

where the constants \\(A\\), \\(B\\) still have to be determined. Note
\\(S(0) = \pi/2 = A + B\\). Also note that \\(S(m)\\) is an even function,{{% sidenote %}}
Note that \\(T(\theta) = \int \cos(m \tan \theta) ~dm\\) would be odd.
{{%/sidenote%}} so we have{{% sidenote %}}
After assuming without loss of generality that \\(m > 0\\).
{{% /sidenote %}}

\\[\begin{aligned} S(-m) &= S(m) \newline Ae^{-m} + Be^m &= Ae^m + Be^{-m} -
\frac\pi2 e^m + \frac\pi2 e^{-m} \newline (B - A)(e^{-m} - e^m) &= -\frac\pi2
(e^{-m} - e^m) \newline B - A &= -\frac\pi2, \end{aligned}\\]

from which it follows that \\(A = \pi/2\\) and \\(B = 0\\), and we finally
obtain

\\[\begin{aligned} S(m) &= \begin{cases} \frac\pi2 e^m, &m < 0, \newline
\frac\pi2 e^{-m}, &m \geq 0.\end{cases} \end{aligned}\\]

## More About the Delta Function

Let us consider the integral

\\[\begin{aligned}
S(\beta) &= \int_{-\infty}^\infty \frac{\sin \beta x}x dx \newline
S'(\beta) &= \int_{-\infty}^\infty \frac{x \cos \beta x}x dx = 2\pi \delta(\beta)\newline
S(\beta) &= \begin{cases} 2\pi + c, &\beta > 0, \newline c, &\beta < 0.\end{cases}
\end{aligned}\\]

\[Figure goes here\]

Consider now the integral{{% sidenote %}}
Evaluating this is a nice, quick exercise, given previous results.
{{% /sidenote %}}


\\[\int_0^\infty e^{-\alpha x} \frac{\sin \beta x}x ~dx = \frac{\pi}{2} - \arctan \frac{\alpha}{\beta}\\]

A graph of this integral looks as follows:

\[Figure\]

In the \\(\lim_{a\to 0},\\) this integral reduces to the one considered
previous to it. (There is a factor of 2 to be considered.)



## Investigation of the Existence of Integrals 

Consider
\\(\displaystyle \int_0^\infty \frac{e^{-ax}}x ~dx.\\)

Near \\(0\\), this integral is approximately \\(\int_0^\infty \frac1x ~dx =
-\ln 0 + \dots.\\) The integral is infinite.

Consider \\(\displaystyle \int_0^\infty \frac{1 - e^{-ax}}x ~dx.\\)

As \\(x \to 0\\), the integral is approximately
\\(\int_0^\infty a ~dx = 0 + \dots\\).

As \\(x \to \infty\\), the integral is approximately \\(\int_0^\infty
\frac1x ~dx = \ln\infty + \dots.\\) Again, the integral is infinite.

The following table of functions may prove useful in determining whether
or not a given integral exists.

| Function              | Finite as \\(x \to \infty\\) | Finite as \\(x \to 0\\) |
|-----------------------|--------------------------|---------------------|
| \\(dx/x^2\\)                | Yes                     |   No |
| \\(dx/x\\)                 |  No                        | No |
|\\(dx/x^{1 + \epsilon}\\)   |Yes                        |No |
|\\(dx/x^{1 - \epsilon}\\)   |No                         |Yes |
|\\(dx\\)                    |No                         |Yes |



## Special Method of Evaluating a Definite Integral 

Let
\\(\displaystyle A = \int\_{-\infty}^\infty e^{-x^2} ~dx\\).{{%sidenote%}}
This is the *probability integral*, so named because it\'s the (scaled) pdf of the normal distribution.
{{% /sidenote %}}

This integral exists,{{% sidenote %}}
Because \\(e^{-x^2} < e^{-\vert x\vert}\\) if \\(\vert x \vert > 1\\) and \\(\int\_{-\infty}^\infty e^{-\vert x \vert} ~dx = 2\\).
{{% /sidenote %}} so its square exists:{{% sidenote %}}
The last line works because the second integral is in a different variable than, and thus constant with respect to, the first.
{{% /sidenote %}}

\\[\begin{aligned} A^2 &= \int_{-\infty}^\infty e^{-x^2} ~dx \cdot
\int_{-\infty}^\infty e^{-y^2} ~dy \newline &= \int_{-\infty}^\infty
\int_{-\infty}^\infty e^{-(x^2 + y^2)} ~dx ~dy. \end{aligned}\\]

Now we convert the double integral to polar coordinates. Make the change
of variables \\(x = r \cos \theta\\), \\(y = r \sin \theta\\):
\\[\begin{aligned} &= \int_0^\infty \int_0^{2\pi} e^{-r^2} \cdot r
~d\theta ~dr \newline &= \int_0^\infty re^{-r^2}
\theta\vert_{\theta=0}^{\theta=2\pi} ~dr \newline &= \int_0^\infty 2\pi
re^{-r^2} ~dr \newline &= 2\pi \lim_{c \to \infty} \left. -\frac12 e^{-r^2}
\right\vert_0^c \newline &= -\pi \lim_{c \to \infty} e^{-c^2} - e^0 \newline &= \pi,
\end{aligned}\\] whereupon we obtain \\(A = \sqrt\pi.\\)



## Series Evaluation of Definite Integrals 

(NB: This section was originally titled \"Series Solution of
Differential Equations,\" but that doesn\'t fit.)

Let\'s compute
\\(\displaystyle \int_0^\infty \frac{dx}{e^{nx} +
e^{-nx}}.\\){{% sidenote %}}\\(= \int_0^\infty \frac12 \operatorname{sech} nx ~dx.\\){{% /sidenote %}}

We have

\\[\begin{aligned} \int_0^\infty \frac{dx}{e^{nx} + e^{-nx}} &=
\int_0^\infty \frac{e^{nx}}{e^{2nx} + 1} ~dx\newline \end{aligned}\\]

This integral can now be evaluated immediately with the substitution $u
= e^{nx}$, but let\'s do it another way by changing it to a series:

\\[\begin{aligned} &= \int_0^\infty e^{nx} \cdot \frac{dx}{1 -
(-e^{2nx})}. \end{aligned}\\]

Since \\(e^{-2nx} < 1\\) if \\(x > 0\\), we have \\[\begin{aligned} &=
\int\_0^\infty e^{nx} \left(\sum_{k = 0}^\infty (-1)^k e^{-2knx}\right)
~dx \newline &= \int_0^\infty e^{nx} \left(\sum\_{k = 0}^\infty (-1)^k
e^{-2knx}\right) ~dx, \end{aligned}\\] and since the series converges
uniformly, we can switch the integral and summation, giving
\\[\begin{aligned} &= \sum_{k = 0}^\infty \int_0^\infty (-1)^k e^{(-2k +
1)nx} ~dx \newline &= \sum_{k = 0}^\infty (-1)^k \left. \frac{1}{(-2k + 1)n}
\cdot e^{(-2k + 1)nx} \right\vert_0^\infty \newline &= \sum_{k = 0}^\infty
\frac{(-1)^k}{(-2k + 1)n} \newline &= \frac1n \sum_{k = 0}^\infty
\frac{(-1)^k}{(-2k + 1)}. \end{aligned}\\] Then, if we observe that the
series is equal to the Taylor series for \\(\arctan x\\) evaluated at \\(x
= 1\\), we can write \\[ \boxed{\int_0^\infty \frac{dx}{e^{nx} + e^{-nx}}
= \frac1n \arctan 1 = \frac1n \cdot \frac\pi4.} \\]

A combination of the methods of integration discussed thus far is
sufficient to solve any integral which exists. There are still other
methods which may be used, and are in many cases easier. We shall
discuss some of them later.



## Problems 



1.  Given \\(\displaystyle\int_0^\infty e^{-a^2x^2} ~dx =
       \frac{\sqrt\pi}{2a},\\) prove that \\[\int_0^\infty
       e^{-a^2x^2} \cos bx ~dx = \frac{\sqrt\pi}{2a} e^{-\frac{b^2}{4a^2}}.\\]

2.  Given \\(\displaystyle\int_0^\infty e^{-x^2} ~dx = \sqrt\pi/2\\), find
    \\[\displaystyle\int_0^\infty x^4e^{-x^2} ~dx.\\]

3.  Find \\[ \int_0^\infty \frac{e^{-ay} - e^{-by}}y ~dy.\\]

4.  Find \\[\int_{-\infty}^\infty e^{-\beta x^2 - \frac\alpha{x^2}} ~dx.\\]

5.  Find \\[\int_0^\infty \frac{\sin^2 x}{x^2} ~dx.\\]

6.  Prove \\(\delta(ax) = \frac1a \delta(x)\\) for \\(a > 0\\), in the sense
    that they have equal integrals over any interval.

7.  Find another form for \\(x\delta''(x)\\).

8.  Find{{% sidenote %}}Hint: Use the previous derivation to obtain \\[\int_0^\infty
       \frac{\cos mx}{k^2 + x^2} ~dx.\\] Then differentiate with respect to \\(k\\).{{% /sidenote %}}
\\[\displaystyle \int_0^\infty \frac{\cos mx}{(1 + x^2)^2}
       ~dx.\\]

9.  Show that{{% sidenote %}} These are called the *Fresnel integrals*, and they are demonstrated beautifully in the Cornu spiral.{{% /sidenote %}} \\[\displaystyle \int_0^\infty \cos(x^2) ~dx = \int_0^\infty \sin(x^2) ~dx = \frac12 \sqrt{\frac\pi2}.\\]

10. Find \\[\int_0^\infty \frac{x}{e^{mx} - e^{-mx}} ~dx.\\]

11. Let \\(\displaystyle\int_0^\infty \frac{\sin x}{\sinh ax} ~dx = S(a).\\)

    1.  Find \\(S(1)\\) to 3 significant figures.
    2.  Find approximate expressions for \\(S(a)\\) for large and small \\(a\\).
