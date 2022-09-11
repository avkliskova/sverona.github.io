---
title: Solutions to infra-exercises I
date: 2022-09-04
math: true
---

These are S's solutions for the [first set of infra-Bayesian exercises](https://drive.google.com/file/d/1aKvftxhG_NL2kfG3tNmtM8a2y9Q1wFHb/view). Spoilers, of course!

I decree this a [Moore method](https://en.wikipedia.org/wiki/Moore_method) problem set! That means you're allowed to be as pedantic about definitions as you like, and I commit to addressing your pedantry. Please shoot me an email if there's a way I can improve this document's rigor and/or clarity!

## Notes
When the document says *monotone,* it means what most analysis textbooks call *increasing.* A better term in the context of posets, where the document defines monotonicity, would be *order-preserving.*

I shall use the terminology *0-nonnegative* rather than *0-increasing* for a functional \\(f : V \to \mathbb R\\) with \\(f(\mathbf 0) \geq 0,\\) since I find the latter misleading. I also like the terminology [*non-expansive*](https://en.wikipedia.org/wiki/Contraction_mapping) for 1-Lipschitzness, since it describes the geometric intuition rather than being named after a dude, but won't use it here for clarity.

I use the variable \\(t\\) for mixture coefficients out of habit.{{% sidenote %}}It's typically used in topology, for instance when [defining homotopy](https://en.wikipedia.org/wiki/Homotopy#Formal_definition).{{% /sidenote %}}

## Problem 1
Let \\(V\\) be a real vector space. Show that a function \\(g : V \to \mathbb R\\) is affine iff \\(g(x) = f(x) + c,\\) where \\(f(x) : V \to W\\) is linear and \\(c \in \mathbb R.\\)


### Solution

*If:* Let \\(g(x)\\) be as given. For any \\(v_1, v_2 \in V\\) and \\(t \in [0, 1],\\) we have
\\[\begin{align*}
g(tv_1 + (1 - t)v_2) &= f(tv_1 + (1 - t)v_2) + c \newline
&= tf(v_1) + (1 - t)f(v_2) + c \newline
&= t(f(v_1) + c) + (1 - t)(f(v_2) + c) \newline
&= t\cdot g(v_1) + (1 - t)\cdot g(v_2).
\end{align*}\\]

*Only if:* Let \\(g(x)\\) be affine. Define \\(f(x) = g(x) - g(\mathbf 0).\\) We must show that \\(f(x)\\) is linear; i.e., homogeneous and additive.

To show homogeneity, we have for any \\(c \in [0, 1]\\)
\\[\begin{align*}
f(cx) &= f(cx + (1 - c)\mathbf 0) \newline
&= g(cx + (1 - c)\mathbf 0) - g(\mathbf 0) \newline
&= c\cdot g(x) + (1 - c)\cdot g(\mathbf 0) - g(\mathbf 0) \newline
&= c\cdot g(x) - g(\mathbf 0) = c \cdot f(x).
\end{align*}\\]

For \\(c > 1\\) we have \\(c^{-1} \in (0, 1).\\) Therefore \\[
\begin{align\*}
f(cx) &= f(c^2x/c) = \dfrac1c f(c^2 x).
\end{align\*}\\]

Rewriting, we have \\(cf(cx) = f(c^2x).\\) Setting \\(y = cx,\\) we obtain the desired. It remains to show that \\(f\\) is homogeneous for a negative constant. We have \\[\begin{align\*}
f(-x) &= g(-x) - g(\mathbf 0) \newline
&= g(-x) - g\left(\dfrac12 x + \dfrac12 (-x)\right) \newline
&= g(-x) - \dfrac12 g(x) - \dfrac12 g(-x) \newline
&= \dfrac12 g(-x) - \dfrac12g(x) \newline
&= \dfrac12 f(-x) - \dfrac12f(x),
\end{align*}\\]
which implies \\(f(-x) = -f(x).\\)

To show additivity, we have for any \\(v_1, v_2 \in V\\)
\\[\begin{align\*}
f(v_1 + v_2) &= 2f\left(\dfrac12 v_1 + \dfrac12 v_2\right) \newline
&= 2g\left(\dfrac12 v_1 + \dfrac12 v_2 \right) - 2g(\mathbf 0) \newline
&= g(v_1) + g(v_2) - 2g(\mathbf 0) = f(v_1) + f(v_2).
\end{align\*}\\]

This completes the proof.

## Problem 2
Let \\(f : \mathbb R \to \mathbb R\\) be continuous and concave. Let \\(T\\) be the set of all affine functions \\(\phi : \mathbb R \to \mathbb R\\) such that \\(\phi(x) \geq f(x)\\) for all \\(x.\\) Show that \\(f(x) = \inf T(x).\\)

### Solution
Fix an \\(a \in \mathbb R.\\) Assume \\(f(a)\\) is defined. \\(f(a)\\) is a lower bound for \\(T(a)\\) by construction.

Suppose \\(k > f(a).\\) We will show that there is a \\(\phi \in T\\) with \\(k > \phi(a).\\)

We claim the set \\(C = \\{(x, y) \in \mathbb R^2 \mid y \leq f(x)\\}\\) is convex and closed:

- *Convex:* Follows directly from concavity of \\(f.\\)
- *Closed:* We show that the complement of \\(C\\) \\[C\' = \\{(x, y) \in \mathbb R^2 \mid y > f(x)\\}\\] is open under the \\(\infty\\)-norm. Let \\(p = (x, y) \in C\'.\\) Let \\(\varepsilon\_1 = (y - f(x))/2 > 0.\\) By continuity of \\(f\\) there is a \\(\delta > 0\\) such that \\[|x\_1 - x\_2| < \delta \implies |f(x\_1) - f(x\_2)| < \varepsilon\_1.\\] Let \\(\varepsilon = \min \\{\varepsilon\_1, \delta\\}.\\) Then whenever \\(|x - x\_1| < \varepsilon\\) and \\(|y - y\_1| < \varepsilon,\\) we have \\[
\begin{align\*}
y\_1 - f(x\_1) &= (y\_1 - y) + \left(y - f(x)\right) + \left(f(x) - f(x\_1)\right) \newline
&> -\varepsilon + 2\varepsilon\_1 - \varepsilon\_1 = \varepsilon\_1 - \varepsilon \geq 0.
\end{align\*}\\]

Since \\(v = (a, k) \in \mathbb R^2 \setminus C,\\) the Hahn-Banach separation theorem furnishes a linear, continuous \\(F : \mathbb R^2 \to \mathbb R\\) and \\(s \in \mathbb R\\) such that \\(F(c) \leq s < F(v)\\) for any \\(c \in C.\\) In particular, there are constants \\(m, n \in \mathbb R\\) such that \\(F((x, y)) = mx + ny.\\) The Hahn-Banach condition then says \\[mx + n \cdot f(x) \leq s < ma + nk.\\]

If \\(n = 0,\\) we have \\(mx < ma\\) for all \\((x, y) \in C,\\) which is absurd, since \\((a, f(a)) \in C.\\) Thus we may define \\(\phi(x) = (s - mx)/n\\). Then we have that \\(\phi\\) is affine, \\(\phi(x) \geq f(x),\\) and \\(\phi(a) < k.\\)

This completes the proof.


## Problem 3a
Let \\(f: \mathbb R \to \mathbb R\\) be concave, monotone, 0-nonnegative, and 1-Lipschitz. Let \\(T\\) be the set of all affine functions \\(\phi : \mathbb R \to \mathbb R\\) satisfying the latter three properties and \\(\phi(x) \geq f(x).\\) Show that \\(f(x) = \inf T(x).\\)

### Solution

Construct \\(\phi\\) as in the previous solution. We must show that \\(\phi\\) is monotone, 0-nonnegative, and 1-Lipschitz.

- *Monotonicity:* Suppose contrariwise that \\(x\_1 < x\_2\\) but \\(\phi(x\_1) > \phi(x\_2).\\) Since \\(\phi\\) is affine, there is some \\(x\_3 > x\_1\\) with \\(\phi(x\_3) < f(x\_1) < f(x\_3),\\) a contradiction.
- *1-Lipschitz:* Suppose contrariwise there are \\(x\_1, x\_2 \in \mathbb R\\) and \\(\varepsilon > 0\\) such that \\[\frac{\phi(x\_2) - \phi(x\_1)}{x\_2 - x\_1} = 1 + \varepsilon.\\] Since \\(\phi\\) is affine, \\(\phi(x) = (1 + \varepsilon)x + \phi(0).\\) Let \\[c < \frac{f(0) - \phi(0)}{\varepsilon} < 0.\\] Then we have \\(f(c) \geq f(0) + c > \phi(0) + (1 + \varepsilon)c = \phi(c),\\) a contradiction.
- *0-nonnegativity:* \\(\phi(0) \geq f(0) \geq 0.\\)

This completes the proof.

## Problem 3b

Let \\(\Phi = \\{\phi_i\\}_{i \in I}\\) be a collection of affine functions mapping \\(\mathbb R \to \mathbb R\\) that are each monotone, 1-Lipschitz, and 0-nonnegative. Show that \\(f(x) = \inf \Phi(x)\\) is continuous, concave, monotone, 1-Lipschitz, and 0-nonnegative.

### Solution

- *0-nonnegativity:* \\(f(0) = \inf \Phi(0) = C.\\)  Suppose \\(C < 0.\\) Then there would exist \\(\phi \in \Phi\\) with \\(\phi(0) = C/2 < 0,\\) a contradiction.
- *Monotonicity:* Suppose contrariwise that \\(x < y\\) but \\(f(x) > f(y).\\) Then, for any \\(\varepsilon > 0,\\) there is a \\(\phi \in \Phi\\) with \\(f(y) = \phi(y) + \varepsilon.\\) We have \\[\begin{align\*}
f(x) - \phi(x) &> f(y) - \phi(x) \newline
&\geq f(y) - [\phi(y) - (y - x)] \newline
&= \varepsilon + (y - x) > 0,
\end{align\*}\\]
a contradiction.
- *1-Lipschitz:* Suppose towards a contradiction that \\(f\\) is not 1-Lipschitz. Then there exist \\(x, y \in \mathbb R\\) with \\[\frac{|f(y) - f(x)|}{|y - x|} = L > 1.\\] Suppose without loss of generality that \\(x < y.\\) Let \\(\varepsilon > 0,\\) choosing \\(\varepsilon < (L - 1)|y - x|.\\) Since \\(f(x) = \inf \Phi(x),\\\) there is a \\(\phi\_i \in \Phi\\) such that \\(\phi\_i(x) = f(x) + \varepsilon.\\) Then we have \\[
\begin{align\*}
f(y) - \phi\_i(y) &\geq f(y) - \left(\phi\_i(x) + |y - x|\right) \newline
&= f(y) - \left(f(x) + \varepsilon + |y - x|\right) \newline
&= [f(y) - f(x)] - \varepsilon - |y - x| \newline
&= L|y - x| - \varepsilon - |y - x| \newline
&= (L - 1)|y - x| - \varepsilon > 0,
\end{align\*}\\]
a contradiction.
- *Continuity:* Follows immediately.
- *Concavity:* Suppose contrariwise that \\(f\\) is not concave. Then there exist \\(x, y \in \mathbb R\\) and \\(t \in (0, 1)\\) such that{{% sidenote %}}The variable names here are for "line" and "curve."{{% /sidenote %}}
\\[L = t\cdot f(x) + (1 - t)f(y) > f(tx + (1 - t)y) = C.\\]

   By assumption, there is a function \\(\phi \in \Phi\\) such that \\(\phi(tx + (1-t)y) = (L + C)/2.\\) We must have \\(\phi(x) \geq f(x)\\) and \\(\phi(y) \geq f(y).\\) But since \\(\phi\\) is affine, we must have \\(\phi(tx + (1-t)y) \geq L,\\) a contradiction.

## Problem 4a

Let \\(\psi : C(X) \to \mathbb R\\) be concave, monotone, 1-Lipschitz, and 0-nonnegative. Let \\(\Phi\\) be the set of all affine, monotone, 1-Lipschitz, and 0-nonnegative functions \\(\phi : C(X) \to \mathbb R\\) such that \\(\phi \geq \psi.\\) Show that \\(\psi = \inf \Phi.\\)

### Solution

\\(\psi\\) is a lower bound for \\(\Phi\\) by construction. Fix \\(f \in C(X)\\) and suppose that \\(k > \psi(f).\\) We shall produce a \\(\phi \in \Phi\\) such that \\(\psi(f) \leq \phi(f) < k.\\)

We claim that the set \\(S = \bigcup_{g \in C(X)} \left(g \times (-\infty, \psi(g)]\right) \subset C(X) \times \mathbb R\\) is closed and convex:

- *Closed:* We show that the complement of \\(S\\) \\[
S\' = \bigcup_{g \in C(X)} \left(g \times (\psi(g), \infty)\right)
\\] is open under the \\(\infty\\)-norm. Let \\((g, c) \in S\'.\\) Let \\(\varepsilon = \left(c - \psi(g)\right)/2.\\) Then for any \\((h, k) \in C(X) \times \mathbb R\\) with \\(d\_\infty(g, h) < \varepsilon\\) and \\(|c - k| < \varepsilon,\\) we have \\[
\begin{align\*}
k - \psi(h) &= (k - c) + \left(c - \psi(g)\right) + \left((\psi(g) - \psi(h)\right) \newline
&> -\varepsilon + 2\varepsilon - d\_\infty(g, h) \newline
&> -\varepsilon + 2\varepsilon - \varepsilon = 0.
\end{align\*}
\\]
- *Convex:* Let \\((f\_1, c\_1), (f\_2, c\_2) \in S.\\) Let \\(t \in (0, 1).\\) Then \\(t \cdot f\_1 + (1 - t)f\_2 \in C(X),\\) and since \\(\psi\\) is concave, \\[
t \cdot \psi(f\_1) + (1 - t)\psi(f\_2) \leq \psi(t\cdot f\_1 + (1-t) f\_2).
\\]

Therefore Hahn-Banach produces a linear functional \\(F: C(X) \times \mathbb R \to \mathbb R\\) and \\(s \in \mathbb R\\) such that for any \\((g, c) \in S,\\) \\(F(g, c) \leq s < F(f, k).\\) Since \\(F\\) is (bi)linear, we can write \\[F(g, c) = F(g, 0) + F(0, c) = M(g) + nc\\] for some linear \\(M : C(X) \to \mathbb R\\) and \\(n \in \mathbb R.\\) The Hahn-Banach condition then says

\\[M(g) + nc \leq s < M(f) + nk.\\]

As before, \\(M \equiv 0\\) and \\(n = 0\\) are impossible. If \\(M \not \equiv 0\\) and \\(n = 0,\\) the Hahn-Banach condition is \\(M(g) < M(f)\\) for all \\(g \in C(X),\\) which is absurd. Thus, we may define \\[\phi(f) = \frac{s - M(g)}n.\\]

Note that \\(\phi\\) is affine. Applying the Hahn-Banach condition to \\((f, \psi(f))\\) gives \\(\psi(f) \leq \phi(f) < k,\\) as desired.

It remains to show that \\(\phi\\) is monotone, 1-Lipschitz, and 0-nonnegative.

- *0-nonnegativity:* \\(\phi(0) \geq \psi(0) \geq 0.\\)
- *Monotonicity:* Suppose contrariwise that \\(f < g\\) but \\(\phi(f) > \phi(g).\\) Since \\(\phi\\) is affine, there is some \\(c \in \mathbb R\\) and \\(h(x) = f(x) + c\\) for which \\(\phi(h) < \psi(f) < \psi(h),\\) a contradiction.
- *1-Lipschitz:* This is the hard part.{{% sidenote %}}It took me multiple days by itself.{{% /sidenote %}}
  Suppose there are \\(f, g \in C(X)\\) and \\(\varepsilon > 0\\) for which \\[|\phi(f) - \phi(g)| = (1 + \varepsilon) d\_\infty(f,g).\\]
  Let \\(U = \max\\{f,g\\}, L = \min\\{f,g\\}.\\) Clearly \\(U, L \in C(X).\\) Also,\\[\begin{align\*}
  \phi(U) - \phi(L)
  &= \phi\left(\frac{f + g + |f - g|}2\right) - \phi\left(\frac{f + g -|f - g|}2\right) \newline
  &= M(|f-g|) \newline
  &\geq \left|M(f-g)\right| \newline
  &= \left|\phi(f) - \phi(g)\right| \newline
  &\geq (1 + \varepsilon) d\_\infty(f, g) = (1 + \varepsilon) d\_\infty(U, L).
  \end{align\*}\\]
  Since \\(U > L,\\) \\(tU + (1-t)L\\) is an increasing function of \\(t.\\) Take \\[t < \dfrac{\psi(L) - \phi(L)}{\varepsilon \cdot d\_\infty(U,L)}.\\]
  If the right-hand side is positive, \\(\phi(L) < \psi(L),\\) which is a contradiction. So, \\(t < 0,\\) and we have \\[\begin{align\*}
     \phi(tU + (1-t)L) &= t\phi(U) + (1-t)\phi(L) \newline
     &= \phi(L) + t\cdot\left(\phi(U) - \phi(L)\right) \newline 
     &\leq \phi(L) + t\cdot (1 + \varepsilon) d\_\infty(U, L) \newline
     &< \phi(L) + \left(\frac{\psi(L) - \phi(L)}{\varepsilon \cdot d\_\infty(U, L)}\right)\cdot \varepsilon \cdot d\_\infty(U, L) + t\cdot  d\_\infty(U, L) \newline
     &= \psi(L) + t \cdot d\_\infty(U, L) \newline
     &= \psi(L) - |t| \cdot d\_\infty(U, L) \newline
     &= \psi(L) - d\_\infty(tU, tL) \newline
     &= \psi(L) - d\_\infty(tU + (1 - t)L, L) \newline
     &\leq \psi(L) - \left(\psi(L) - \psi(tU + (1 - t)L)\right) \newline
     &= \psi(tU + (1-t)L),
 \end{align\*}\\] a contradiction.

This completes the proof.

## Problem 4b

Let \\(\Phi = \\{\phi\_i\\}\_{i\in I}\\) be a collection of affine functions mapping \\(C(X) \to \mathbb R\\) that are monotone, 1-Lipschitz, and 0-nonnegative. Show that \\(f = \inf \Phi\\) is continuous, concave, monotone, 1-Lipschitz, and 0-nonnegative.

### Solution
- *0-nonnegativity:* Suppose contrariwise that \\(f(0) < 0.\\) Then there must be \\(\phi\_i\\) with \\(\phi\_i(0) = f(0)/2 < 0,\\) a contradiction.
- *Monotonicity:* Suppose contrariwise that there exist \\(m, n \in C(X)\\) with \\(m < n\\) and \\(f(m) > f(n).\\) By assumption, for any \\(\varepsilon > 0,\\) there is a \\(\phi\_i\\) with \\(f(n) = \phi\_i(n) + \varepsilon.\\) Then we have \\[\begin{align\*}
f(m) - \phi\_i(m) &> f(n) - \phi\_i(m) \newline
&= \phi\_i(n) - \phi\_i(m) + \varepsilon > 0,
\end{align\*}\\]
a contradiction.
- *1-Lipschitz:* Suppose there are functions \\(m, n \in C(X)\\) and \\(\delta > 0\\) with \\[\frac{|f(n) - f(m)|}{d\_\infty(m, n)} = 1 + \delta.\\] Without loss of generality, assume \\(f(n) \geq f(m).\\) Let \\(0 < \varepsilon < \delta \cdot d\_\infty(m, n).\\) There is a \\(\phi\_i\\) with \\(\phi\_i(m) = f(m) + \varepsilon.\\) We have
\\[\begin{align\*}
f(n) - \phi\_i(n) &= f(m) + (1 + \delta) d\_\infty(m, n) - \phi\_i(n) \newline
&\geq f(m) + \delta \cdot d\_\infty(m, n)  + |\phi\_i(n) - \phi\_i(m)| - \phi\_i(n) \newline
&\geq f(m) + \delta \cdot d\_\infty(m, n) - \phi\_i(m) \newline
&= \delta \cdot d\_\infty(m, n) - \varepsilon > 0,
\end{align\*}\\]
a contradiction.
- *Continuity:* Follows immediately.
- *Concavity:* Suppose contrariwise that \\(f\\) is not concave. Then there exist \\(g, h \in C(X)\\) and \\(t \in (0, 1)\\) such that \\[L = t \cdot f(g) + (1 - t) f(h) > f(t \cdot g + (1 - t) h) = C.\\] By assumption, there is a \\(\phi \in \Phi\\) with \\(\phi(t \cdot g + (1 - t)h) = (L + C)/2,\\) \\(\phi(g) \geq f(g),\\) and \\(\phi(h) \geq f(h).\\) But since \\(\phi\\) is affine, we must have \\(\phi(t \cdot g + (1 - t)h) \geq L,\\) a contradiction.

This completes the proof.

## Problem 5b

Let \\(m \in \mathcal M^\pm(X).\\) Show that \\(\phi : C(X) \to \mathbb R\\) defined by \\(\phi(g) = \int_X g(x) ~\mathrm dm\\) is a continuous linear functional.

### Solution

Lebesgue integrals are always linear. Let \\(\varepsilon > 0.\\) We must produce \\(\delta > 0\\) such that whenever \\(d\_\infty(f, g) < \delta,\\) \\[\left| \int\_X f ~\mathrm dm - \int\_X g ~\mathrm dm \right| < \varepsilon.\\]
If \\(m \\) is the zero measure then there is nothing to prove. Suppose \\(m\\) is nonzero. Let \\[\delta = \frac{\varepsilon}{\int\_X \mathrm dm^+ + \int\_X \mathrm dm^-}.\\] Then we have
\\[\begin{align\*}
\left| \int\_X f ~\mathrm dm - \int_X g ~\mathrm dm \right| &= \left| \int\_X (f - g) ~\mathrm dm \right| \newline
&= \left| \int\_X (f-g) ~\mathrm dm^+ - \int_X (f - g) ~\mathrm dm^- \right| \newline
&\leq \left|\int\_X (f - g) ~\mathrm dm^+ \right| + \left| \int\_X (f - g) ~\mathrm dm^- \right| \newline
&\leq \int\_X |f - g| ~\mathrm dm^+ + \int\_X |f - g| ~\mathrm dm^- \newline
&< \int\_X \delta ~\mathrm dm^+ + \int\_X \delta ~\mathrm dm^- \newline
&= \delta \left[\int\_X \mathrm dm^+ + \int\_X \mathrm dm^- \right] = \varepsilon.
\end{align\*}\\]

## Problem 5c
What extra conditions on a continuous linear functional \\(F : C(X) \to \mathbb R\\) are required so that it corresponds to a positive measure? What about a probability measure?

### Solution

Say \\(F\\) is *positive* if whenever \\(f \geq 0,\\) \\(F(f) \geq 0.\\) By Riesz-Markov-Kakutani, positive functionals correspond to positive measures. Note that this implies monotonicity by the linearity of \\(F.\\)

To have a probability measure, we need \\(F(1) = \int\_X \mathbf 1\_X ~\mathrm dm = m(X) = 1.\\) Note that this implies 1-Lipschitzness: if \\(d\_\infty(f, g) = \varepsilon\\) and \\(F\\) is positive, then
\\[\begin{align\*}
| F(f) - F(g) | = | F(f - g) | \leq F\left( | f-g | \right) \leq F(\varepsilon) = \varepsilon F(1) = \varepsilon.
\end{align\*}\\]

## Problem 6
Let \\(\phi : C(X) \to \mathbb R\\) be affine, monotone, 1-Lipschitz, and 0-nonnegative. Show that \\(\phi\\) corresponds to an affine measure \\((m, b)\\) with \\(0 \leq m(X) \leq 1.\\)

### Solution

We have \\(\phi(f) = M(f) + \phi(0),\\) where \\(M\\) is linear and monotone, hence corresponds to a positive measure \\(m.\\) Since \\(M\\) is 1-Lipschitz, we have \\(m(X) = M(1) \in [0, 1].\\)

## Fundamental Theorem of Inframeasures, forward direction

Let \\(\psi : C(X) \to \mathbb R\\) be concave, monotone, 1-Lipschitz, and 0-increasing. Let \\(T\\) be the set of (positive) affine measures above \\(\psi\\):
\\[T = \\{(m, b): m(g) + b \geq \psi(g) \text{ for all } g \in C(X)\\}.\\]

Prove that \\(\psi(g) = \inf\_{(m, b) \in T} (m(g) + b).\\)

### Solution
We need to show that each \\((m, b) \in T\\) corresponds to an affine \\(\phi : C(X) \to \mathbb R\\) such that \\(\phi \geq \psi \\) and \\(\phi\\) is 1-Lipschitz, 0-nonnegative, and monotone. Define \\(\phi(g) = m(g) + b.\\) Then \\(\phi\\) is affine and above \\(\psi\\) by definition.

- *Monotonicity:* Since \\(m\\) is positive, \\(\phi\\) is monotone.
- *0-nonnegativity:* \\(\phi(\mathbf 0) = m(\mathbf 0) + b \geq \phi(\mathbf 0) > 0.\\)
- *1-Lipschitz*: It suffices to show that \\(m(\mathbf 1) \leq 1.\\) Suppose contrariwise that \\(m(\mathbf 1) = 1 + \varepsilon.\\) Let \\(a < (\psi(\mathbf 0) - b)/\varepsilon \leq 0.\\) Then
\\[\begin{align\*}
\phi(a\mathbf 1) &= a \cdot m(\mathbf 1) + b \newline
&= a(1 + \varepsilon) + b \newline
&< a + \varepsilon\left(\frac{\psi(\mathbf 0) - b}\varepsilon\right) + b \newline
&= \psi(\mathbf 0) + a \newline
&\leq \psi(a\mathbf 1),
\end{align\*}\\]
a contradiction.

This completes the proof.

## Fundamental Theorem of Inframeasures, backward direction
For all sets \\(\Psi\\) of affine measures \\(m\\) with \\(0 \leq m(\mathbf 1) \leq 1,\\) show that the functional \\(\psi : C(X) \to \mathbb R\\) defined by \\[\psi(g) = \inf\_{(m, b) \in \Psi} (m(g) + b)\\] is concave, monotone, 1-Lipschitz, and 0-nonnegative.

### Solution

\\(\Psi\\) corresponds to a set \\(\Phi\\) of affine, monotone, 1-Lipschitz, 0-nonnegative functionals via \\((m, b) \mapsto (g \mapsto m(g) + b).\\)
