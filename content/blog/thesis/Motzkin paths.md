---
title: Paths and tableaux 
description: Some combinatorial conjectures.
sequence: thesis
date: 2020-11-01
completion_status: complete
epistemic_status: confident
weight: 7
---

## Motzkin paths {#motzkin-paths-1}

{{% div class="definition" %}}
A *topside peakless Motzkin path* of length \\(n\\) is a sequence \\(\{p\_i\}\_{i=1}^n\\) such that for each \\(1 \leq i \leq n,\\)
1. \\(p\_i \in \{-1, 0, 1\};\\)
2. \\(\sum\_{k=1}^i p\_k \geq 0;\\)
3. if \\(p\_{i - 1} = 1\\), \\(p\_i \not = -1,\\)
and for which \\(\sum\_{i=1}^n p\_i = 0.\\)
{{% /div %}}

By calling \\(\{p\_i\}\_{i=1}^n\\) a "path," we mean to identify it with
the series of points \\(\{(i, \sum\_{k=1}^i p\_k)\}\_{i=1}^n\\). The above
definition then says

1. that the path goes from \\((0, 0)\\) to \\((n, 0)\\);
2. that it remains on or above the \\(x\\)-axis (*topside*);
3. and that no step \\(\nearrow\\) is immediately followed by a step \\(\searrow\\) (*peakless*).

There are four topside peakless Motzkin paths of length \\(4\\), depicted in
Figure 5.1.

{{% div class="fullwidth flex" %}}
{{% figure src="/images/motzkin1.png" %}}
{{% figure src="/images/motzkin2.png" %}}
{{% figure src="/images/motzkin3.png" %}}
{{% figure src="/images/motzkin4.png" %}}
{{% /div %}}

The sequence \\(P\_n\\) is A004148 in the OEIS [@oeis-motzkin] and runs 1, 1,
1, 2, 4, 8, 17, 37, ....

## Littlewood-Richardson tableaux

{{% figure class="marginfigure" src="/images/tableau-unfilled.png" %}}

{{% div class="definition" %}}
Let \\(P, Q \in \mathbb Z^n\\) be weakly decreasing \\(n\\)-tuples of nonnegative integers with \\(p\_i > q\_i\\) for each \\(i \in [n].\\) A *Littlewood-Richardson tableau* of shape \\(P/Q\\) is an assignment of \\(1\\), \\(2\\), or \\(3\\) to each empty square in a diagram such as Figure 5.2 satisfying the following conditions:
1. each row is weakly increasing, read left to right;
2. each column is strongly increasing, read top to bottom;
3. when following the diagram by rows, *right to left,* top to bottom, it is always true that the count of 1s is at least the count of 2s is at least the count of 3s.
{{% /div %}}

We will mainly be concerned with tableaux of the shape
\\((n, n-1, n-3, \dots)/(n - 2, n - 4, \dots)\\).{{% sidenote %}}The dots indicate that
the shape vector entries decrease to zero rather than becoming
negative.{{% /sidenote %}} When \\(n = 4\\), there are four valid LR tableaux of this shape,
depicted in Figure 5.3.

{{% div class="fullwidth flex" %}}
{{% figure src="/images/tableau1.png" %}}
{{% figure src="/images/tableau2.png" %}}
{{% figure src="/images/tableau3.png" %}}
{{% figure src="/images/tableau4.png" %}}
{{% /div %}}

## Equinumeracy?

The alert reader will notice that the sequence that counts peakless
Motzkin paths also apparently counts LR tableaux of the shape
\\((n,n-1,n-3)/(n-2,n-4,\dots).\\)

{{% div class="conjecture" %}}
For any \\(n \geq 0\\), the number of LR tableaux of the given shape is given by \\(P\_n.\\)
{{% /div %}}
This is confirmed computationally (see Chapter 6) up to at least
\\(n = 26\\) (at which both sequences number \\(560954047.\\))

One possible attack on this conjecture is as follows. Define the
*maximal prefix* of any LR tableau to be the largest \\(n\\) such that the
first \\(1, 2, \dots, n\\) columns of the tableau (read from left to right)
themselves form a valid tableau. Necessarily, if the maximal prefix is
less than \\(n\\), taking the first \\(n + 1\\) columns must violate one of the
LR conditions.

The reader may verify that the tableaux in Figure 5.3 above, from left
to right, have maximal prefixes \\(4\\), \\(0\\), \\(1\\), and \\(0\\). It is clear that
exactly one tableau, the one given by taking the smallest allowable
choice for each number, has maximal prefix \\(n\\). Observe that exactly
\\(2 = 4 - 2 = P\_4 - P\_3\\) tableaux have maximal prefix \\(0\\); exactly
\\(1 = P\_3 - P\_2\\) tableau has maximal prefix \\(1\\); and
\\(0 = P\_2 - P\_1 = P\_1 - P\_0\\) tableaux have maximal prefix \\(2\\) or \\(3\\).

{{% div class="conjecture" %}}
The number of \\(n\\)-column LR tableaux having maximal prefix \\(k = 0, 1, \dots, n - 1\\) is given by \\(P\_{n - k} - P\_{n - k - 1}.\\)
{{% /div %}}

Since the maximal prefix is well-defined, this would immediately imply
Conjecture 5.1. There is also computational evidence to support this
pattern.

Since we have
\\(P\_{n - k} - P\_{n - k - 1} = \sum\_{i=3}^{n-k} P\_{i-2}P\_{n - k - i},\\) a
characterization of a tableau having maximal prefix \\(k\\) as a
concatenation of two freely chosen tableaux of the appropriate lengths,
in the spirit of Proposition 5.1, would suffice.
