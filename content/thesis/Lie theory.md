---
title: Lie theory
description: Rudiments of the theory of Lie algebras and their representations.
sequence: thesis
date: 2020-11-01
completion_status: complete
epistemic_status: confident
weight: 4
math: true
---

A full exposition of the theory of Lie algebras and their representations is well beyond the scope of this paper. We provide here only the necessary definitions and theorems to read [Chapter 3](../supporting-graphs).
 
We loosely follow [Humphreys 1972].{{% sidenote %}}James E. Humphreys. *Introduction to Lie algebras and representation theory.* Springer-Verlag, 1972.{{% /sidenote %}} An introduction to the subject more suitable for advanced undergraduates is [EW 2006].{{% sidenote %}}Karin Erdmann and Mark J. Wildon. *Introduction to Lie algebras.* Springer-Verlag, 2006.{{% /sidenote %}}


{{% div class="definition" %}}
 A *Lie algebra* is a vector space \\(\mathfrak g\\)
together with a *bracket* operation
\\([ \cdot, \cdot ] : \mathfrak g \times \mathfrak g \to \mathfrak g\\)
satisfying the following axioms for each \\(x, y, z \in \mathfrak g\\) and
scalars \\(a, b\\):

1.  *bilinearity:* \\([ax + by, z] = a[x, z] + b[y, z]\\);
2.  *anticommutativity:* \\([x, y] = -[y, x]\\);
3.  the *Jacobi identity:*
    \\([x, [y, z]] + [y, [z, x]] + [z, [x, y]] = 0.\\)


{{% /div %}}


When no confusion can result, we shall sometimes write the bracket
operator \\([X, Y]\\) as just \\([XY],\\) omitting the comma.

A familiar example of a Lie algebra is the vector space \\(\mathbb R^3\\)
with the cross product as bracket. We leave the verification of the
above axioms in this case to the reader. We shall now produce some more
relevant examples.


{{% div class="definition" %}}
 The *general linear algebra* over an abstract
vector space \\(V,\\) written \\(gl(V),\\) is the algebra of linear
endomorphisms over \\(V\\) with function composition as multiplication. For
\\(n \in \mathbb N\\) and a field \\(\mathbb F,\\) we identify \\(gl(V)\\) with the
algebra of \\(n \times n\\) matrices over \\(V\\) by fixing a basis.

{{% /div %}}



{{% div class="proposition" %}}
 Any nonempty subset of \\(gl(V)\\) closed under the
*commutator* operation defined by \\([X, Y] \coloneqq XY - YX\\) forms a Lie
algebra, with the commutator as bracket. 
{{% /div %}}



{{% div class="proof" %}}
 Clearly the commutator is bilinear, viz. \\[\begin{aligned}
[aX + bY, Z] &= (aX + bY)Z - Z(aX + bY) \newline
&= aXZ + bYZ - aZX + bZY \newline
&= a(XZ - ZX) + b(YZ - ZY) \newline
&= a[XZ] + b[YZ],
\end{aligned}\\] and anticommutative, viz. \\([XY] = XY - YX = -[YX].\\)

Thus we have to show that arbitrary elements \\(X, Y, Z\\) of \\(gl(V)\\) obey
the Jacobi law \\([X, [YZ]] + [Y, [ZX]] + [Z, [XY]] = 0.\\) We calculate:
\\[\begin{aligned}
& \quad [X, [YZ]] + [Y, [ZX]] + [Z, [XY]] \newline
= & \quad [X, (YZ - ZY)] + [Y, (ZX - XZ)] + [Z, (XY - YX)] \newline
= & \quad X(YZ - ZY) - (YZ - ZY)X \newline
  & + Y(ZX - XZ) - (ZX - XZ)Y \newline
  & + Z(XY - YX) - (XY - YX)Z \newline
= & \quad XYZ - XZY - YZX + ZYX \newline
 & + YZX - YXZ - ZXY + XZY \newline
 & + ZXY - ZYX - XYZ + YXZ \newline
= & \quad 0.
\end{aligned}\\] 
{{% /div %}}


Thus we can furnish examples of Lie algebras simply by producing
collections of matrices closed under the bracket.

## Classical Lie algebras

The theory of general Lie algebras is quite rich. For our purposes it
will suffice to limit our field of view to the following four families,
which for historical reasons are collectively referred to as the
*classical* Lie algebras.

### The special linear algebra \\(A_n\\)

The *trace* of a square matrix \\(M = (m_{ij})\_{1 \leq i, j \leq n}\\)
is the sum of its diagonal elements
\\(\operatorname{tr} M = \sum_{i=1}^n m_{ii}.\\)


{{% div class="proposition" %}}
 Let \\(M\\) be an \\(n \times n\\) matrix. Then
\\(\operatorname{tr} M\\) is invariant under changes of basis.

{{% /div %}}



{{% div class="proof" %}}
 Let \\(B\\) be an invertible \\(n \times n\\) matrix, and
let \\(M\_B = B^{-1}MB.\\) Denote the \\((ij)\\) entry of \\(M\\) by \\([M]\_{ij}.\\)
We have \\[\begin{aligned}
\operatorname{tr} M\_B &= \sum\_{i=1}^n [B^{-1} M B]\_{ii} \newline
&= \sum\_{i=1}^n \sum\_{j = 1}^n [B^{-1}]\_{ij} [MB]\_{ji} \newline
&= \sum\_{i=1}^n \sum\_{j = 1}^n [B^{-1}]\_{ij} \sum\_{k = 1}^n [M]\_{jk} [B]\_{ki} \newline
&= \sum\_{k=1}^n \sum\_{j = 1}^n [M]\_{jk} \sum\_{i = 1}^n [B]\_{ki} [B^{-1}]\_{ij} \newline
&= \sum\_{k=1}^n \sum\_{j = 1}^n [M]\_{jk} [I\_n]\_{kj} \newline
&= \sum\_{k=1}^n \sum\_{j = 1}^n [M]\_{jk} \delta\_{jk} \newline
&= \operatorname{tr} M.
\end{aligned}\\] 
{{% /div %}}



{{% div class="proposition" %}}
 The set of \\(n \times n\\) matrices with zero
trace forms a Lie algebra. 
{{% /div %}}



{{% div class="proof" %}}
 Let \\(M, M'\\) be \\(n \times n\\) matrices.{{% sidenote %}} It suffices to show that if two matrices each have zero trace, so does their commutator. In fact the commutator of any two matrices has zero trace, which is what we actually show.  {{% /sidenote %}}

Then we have:

\\[\begin{aligned}
\operatorname{tr} [MM'] &= \operatorname{tr} (MM' - M'M) \newline
&= \sum\_{i=1}^n (MM' - M'M)\_{ii} \newline
&= \sum\_{i=1}^n (MM')\_{ii} - (M'M)\_{ii} \newline
&= \sum\_{i=1}^n \sum\_{j=1}^n M\_{ij}M'\_{ji} - \sum\_{i=1}^n \sum\_{j=1}^n M'\_{ij} M\_{ji} \newline
&= \sum\_{i=1}^n \sum\_{j=1}^n M\_{ij}M'\_{ji} - \sum\_{j=1}^n \sum\_{i=1}^n M\_{ji}M'\_{ij} \newline
&= \sum\_{i=1}^n (MM')\_{ii} - \sum\_{j=1}^n (MM')\_{jj} = 0.
\end{aligned}\\] 
{{% /div %}}



{{% div class="definition" %}}
 The Lie algebra of \\((n + 1) \times (n + 1)\\)
matrices with zero trace is called the *special linear algebra of
rank \\(n\\)* and denoted \\(A\_n.\\) 
{{% /div %}}


### The orthogonal algebras \\(B\_n,\\) \\(D\_n\\)


{{% div class="definition" %}}
 A matrix \\(M\\) is *skew-symmetric* if
\\(M^\top = -M.\\) 
{{% /div %}}



{{% div class="proposition" %}}
 Let \\(S\\) be a symmetric matrix. Then the set
of all matrices \\(M\\) such that \\(SM\\) is skew-symmetric forms a Lie
algebra. 
{{% /div %}}
 
{{% div class="proof" %}}
 Suppose \\((SM)^\top = -SM,\\)
\\((SN)^\top = -SN.\\) We need to show that \\((S[MN])^\top = -S[MN].\\) We
have \\[\begin{aligned}
(S[MN])^\top &= (SMN)^\top - (SNM)^\top \newline
&= N^\top M^\top S^\top - M^\top N^\top S^\top \newline
&= N^\top M^\top S - M^\top N^\top S \newline
&= N^\top (-SM) - M^\top(-SN) \newline
&= -N^\top SM + M^\top SN \newline
&= (SN)M - (SM)N = -S[MN].
\end{aligned}\\] 
{{% /div %}}



{{% div class="definition" %}}
 If \\(n = 2k  + 1\\) is odd, the set of all matrices such that
\\[ SM = \begin{bmatrix}1 & 0 & 0 \newline 0  & 0 & I\_k \newline 0 & I\_k & 0\end{bmatrix}M \\]
is skew-symmetric forms the *odd orthogonal Lie algebra of rank \\(k\\)*, denoted \\(B\_k.\\)
{{% /div %}}



{{% div class="definition" %}}
 If \\(n = 2k\\) is even, the set of all matrices such that
\\[SM = \begin{bmatrix}0 & I\_k \newline I\_k & 0\end{bmatrix}M\\] is skew-symmetric forms the *even
orthogonal algebra of rank \\(k\\)*, denoted \\(D\_k.\\) 
{{% /div %}}


### The symplectic algebra \\(C\_n\\)


{{% div class="definition" %}}
 A \\(2n \times 2n\\) matrix \\(M\\) is *symplectic* if
the matrix \\(
SM = \begin{bmatrix} \mathbf 0\_n & \mathbf I\_n \newline -\mathbf I\_n & \mathbf 0\_n \end{bmatrix}M
\\) is symmetric. 
{{% /div %}}



{{% div class="proposition" %}}
The set of \\(2n \times 2n\\) symplectic matrices
forms a Lie algebra, called the *symplectic algebra of rank \\(n\\)* and
denoted \\(C_n.\\) 
{{% /div %}}
 
{{% div class="proof" %}}
 Suppose \\(M, N\\) are
\\(2n \times 2n\\) matrices such that \\(SM = (SM)^\top,\\)
\\(SN = (SN)^\top.\\) Then \\[\begin{aligned}
S[MN] &= SMN - SNM \newline
&= (SM)^\top N - (SN)^\top M \newline
&= M^\top S^\top N - N^\top S^\top M \newline
&= - M^\top S N + N^\top S M \newline
&= - M^\top (S N)^\top + N^\top (S M)^\top \newline
&= - (S N M)^\top + (S M N)^\top \newline
&= (SMN - SNM)^\top = (S[MN])^\top.
\end{aligned}\\] 
{{% /div %}}


## Ideals and simplicity


{{% div class="definition" %}}
 Given a Lie algebra \\(\mathfrak{g},\\) a subalgebra
\\(\mathfrak{h}\\) is an *ideal* of \\(\mathfrak{g}\\) provided that for any
\\(h \in \mathfrak{h},\\) \\(g \in \mathfrak{g},\\) \\([gh] \in \mathfrak{h}.\\)

{{% /div %}}



{{% div class="definition" %}}
 A function \\(\phi : \mathfrak{g} \to \mathfrak{g}'\\)
is a *homomorphism of Lie algebras* provided that it is linear and it
preserves the bracket. 
{{% /div %}}


The usual homomorphism theorems hold, in particular the following:


{{% div class="theorem" %}}
 Let \\(\phi : \mathfrak g \to \mathfrak g'\\) be a
homomorphism of Lie algebras. Then
\\(\ker \phi = \\{x \in \mathfrak g : \phi(x) = 0\\}\\) is an ideal of
\\(\mathfrak g.\\) 
{{% /div %}}



{{% div class="proof" %}}
Left to reader.
{{% /div %}}



{{% div class="definition" %}}
 A Lie algebra \\(\mathfrak{g}\\) is said to be
*simple* if its only ideals are \\(0\\) and \\(\mathfrak{g}\\) (and it is not
the one-dimensional algebra.) 
{{% /div %}}



{{% div class="definition" %}}
 A Lie algebra is said to be *semisimple* if it can
be written as a direct sum of simple Lie algebras. 
{{% /div %}}


For the purposes of this paper, it will suffice to think of semisimple
Lie algebras as being well-behaved. The examples we consider in the
sequel are all semisimple.

## Toral subalgebras and roots {#root-decomposition}

We take a short recess here to discuss certain combinatorial-geometric
objects called *root systems.* This discussion, while appearing somewhat
unmotivated, turns out to be crucial to understanding the structure of
semisimple Lie algebras.


{{% div class="definition" %}}
 Consider \\(\mathbb R^n\\) as a vector space with the
standard (Euclidean) inner product. The *normal hyperplane* to
\\(v \in \mathbb R^n,\\) denoted \\(v^\perp,\\) is the set of all vectors
orthogonal to \\(v.\\) 
{{% /div %}}



{{% div class="proposition" %}}
 For any \\(v \in \mathbb R^n,\\) there exists a
unique endomorphism \\(r_v\\) such that

1.  \\(r_v(w) = w\\) for every \\(w \in v^\perp,\\) and
2.  \\(r_v(v) = -v,\\)

which we shall call the *reflection through* \\(v^\perp.\\) 
{{% /div %}}



{{% div class="proof" %}}
 Let \\(B\\) be a basis of \\(\mathbb R^n\\) containing \\(v.\\)
Orthogonalizing \\(B\\) with respect to \\(v\\) gives a basis
\\(B' = (v, w_1, \dots, w_{n - 1}).\\) Note \\(v^\perp\\) is a
\\((n-1)\\)-dimensional vector space spanned by \\(B' \setminus \\{v\\}.\\) Let
\\(r_v\\) be the endomorphism whose matrix relative to \\(B'\\) is
\\(\operatorname{diag}(-1, 1, \dots, 1).\\) Then it is easily checked that
\\(r_v(w) = w\\) for \\(w \in v^\perp\\) and \\(r_v(v) = -v.\\) 
{{% /div %}}


The above proof makes clear that \\(r_v^2 = I_n,\\) as befits its name. We
now give an explicit formula for \\(r_v.\\)


{{% div class="proposition" %}}
 For any \\(v \in \mathbb R^n,\\)
\\(r_v(w) = w-  2 \operatorname{proj}_v w.\\) 
{{% /div %}}
 
{{% div class="proof" %}}

Without loss of generality, take \\(w\\) relative to the basis \\(B'.\\) Then
\\[\begin{aligned}
r_v = \operatorname{diag}(-1, 1, \dots, 1) &= I_n - 2 \operatorname{diag}(1, 0, \dots, 0); \newline
r_v(w) &= w - 2 \operatorname{diag}(1, 0, 0, 0) w = w - 2 \operatorname{proj}_v w.
\end{aligned}\\] 
{{% /div %}}


The number
\\(\langle v, w \rangle = 2 \frac{\Vert \operatorname{proj}_v w \Vert}{\Vert v\Vert} = 2 \frac{v \cdot w}{v \cdot v}\\)
denotes the scalar multiple of \\(v\\) separating \\(w\\) and \\(r_v(w).\\)

We are now ready for the central definition.


{{% div class="definition" %}}
 Let \\(\mathbb R^n\\) be a vector space with the
usual inner product. Then a finite spanning set of vectors \\(\Phi \subset
\mathbb R^n\\) is said to be a *root system* if

1.  \\(\mathbf 0 \not \in \Phi.\\)
2.  For any \\(\alpha \in \Phi,\\) the only other scalar multiple of
    \\(\alpha\\) belonging to \\(\Phi\\) is \\(-\alpha.\\)
3.  For any \\(\alpha \in \Phi,\\) \\(r\_\alpha(\Phi) = \Phi\\); that is, \\(\Phi\\)
    is symmetric about \\(\alpha.\\)
4.  For any \\(\alpha, \beta \in \Phi,\\) \\(\langle \alpha, \beta \rangle\\) is
    an integer.

{{% /div %}}



{{% div class="fullwidth flex" %}}
{{% figure src="/images/a1.png" caption="\\(A\_1\\), rank 1" %}}
{{% figure src="/images/a2.png" caption="\\(A\_1\\), rank 2" %}}
{{% figure src="/images/b2.png" caption="\\(B\_2\\), rank 2" %}}
{{% figure src="/images/g2.png" caption="\\(G\_2\\), rank 2" %}}
{{% /div %}}



{{% div class="definition" %}}
 A *base* of a rank-\\(n\\) root system \\(\Phi\\) is a
subset \\(\Delta \subset \Phi\\) such that

1.  \\(\Delta\\) is a basis for \\(\mathbb R^n\\);
2.  the nonzero basis coefficients, relative to \\(\Delta,\\) of any
    \\(\phi \in \Phi\\) are either all positive (in which case \\(\phi\\) is
    called a *positive root*) or all negative.


{{% /div %}}


For completeness we mention the following fact:


{{% div class="theorem" %}}
 Every root system has a base. 
{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972] §10.1. 
{{% /div %}}


The usual bases of each root system are indicated above with the labels
\\(\alpha\\) and \\(\beta.\\)

At this point we return to our discussion of Lie algebras, which for the
remainder of this section we will take to be finite-dimensional over a
field \\(\mathbb F.\\)


{{% div class="definition" %}}
 The *center* of a Lie algebra \\(\mathfrak g\\) is the
set
\\[Z(\mathfrak g) \coloneqq \\{z \in \mathfrak g : [zg] = 0 \quad \forall g \in \mathfrak g\\}.\\]

{{% /div %}}



{{% div class="proposition" %}}
Any subalgebra of \\(Z(\mathfrak g),\\) including \\(Z(\mathfrak g)\\) itself, is an ideal of \\(\mathfrak g.\\) 
{{% /div %}}



{{% div class="proof" %}}
 Left to reader. 
{{% /div %}}



{{% div class="lemma" %}}
 If \\(\mathfrak g\\) is a simple Lie algebra, then
\\(Z(\mathfrak g) = \\{0\\}.\\) 
{{% /div %}}



{{% div class="proof" %}}
 Let
\\(z \in Z(\mathfrak g).\\) \\(\operatorname{span} z,\\) the one-dimensional
subalgebra spanned by \\(z,\\) is an ideal of \\(\mathfrak g.\\) Since
\\(\mathfrak g\\) is not one-dimensional (by definition,)
\\(\operatorname{span} z \not = \mathfrak g.\\) But since \\(\mathfrak g\\) is
simple, this implies \\(\operatorname{span} z = \\{0\\}.\\) Thus \\(z = 0.\\)

{{% /div %}}



{{% div class="proposition" %}}
 If \\(\mathfrak g\\) is a semisimple Lie algebra,
then \\(Z(\mathfrak g) = \\{0\\}.\\) 
{{% /div %}}



{{% div class="proof" %}}
 Write
\\(\mathfrak g\\) as a direct sum of simple algebras, say
\\(\mathfrak g = \bigoplus_{k=1}^n \mathfrak g_i.\\) Any
\\(z \in Z(\mathfrak g)\\) can then be written as \\(z = \sum_{k=1}^n z_i,\\)
where \\(z_i \in \mathfrak g_i.\\)

We claim that, in fact, \\(z_i \in Z(\mathfrak g_i).\\) To see this, note
that for any \\(g \in \mathfrak g_i,\\) \\(0 = [zg] = \sum_{k=1}^n [z_kg].\\)
Since \\(\mathfrak g_i\\) and \\(\mathfrak g_j\\) are orthogonal if
\\(i \not = j,\\) we have \\([z_ig] = 0.\\)

Since \\(\mathfrak g_i\\) is simple, \\(Z(\mathfrak g_i) = \\{0\\},\\) so
\\(z_i = 0.\\) Thus \\(z = 0.\\) 
{{% /div %}}



{{% div class="definition" %}}
 For a subalgebra \\(\mathfrak h\\) of \\(\mathfrak g,\\)
define the _dual space_ \\(\mathfrak h^\*\\) to be the space of linear
functionals \\(\alpha : \mathfrak h \to \mathbb F.\\) For any
\\(\alpha \in \mathfrak h^\*,\\) define
\\(\mathfrak g\_\alpha \coloneqq \\{x \in \mathfrak g : [hx] = \alpha(h)x \quad \forall h \in \mathfrak h\\},\\)
and define
\\(\Phi \coloneqq \\{\alpha \in \mathfrak h^\* : \alpha \not = 0, \mathfrak g\_\alpha \not = 0\\}.\\)

If
\\(\mathfrak g = \bigoplus_{\alpha \in \Phi\cup \\{0\\}} \mathfrak g_\alpha,\\)
the subalgebra \\(\mathfrak h\\) is called *toral.* Additionally, if this
condition is met,

1.  elements of \\(\Phi\\) are called *roots* of \\(\mathfrak g\\) (relative to
    \\(\mathfrak h\\);)
2.  for any \\(\alpha \in \Phi,\\) \\(\mathfrak g_\alpha\\) is called a *root
    space*;
3.  the equality
    \\(\mathfrak g = \bigoplus\_{\alpha \in \Phi \cup \\{0\\}} \mathfrak g\_\alpha\\)
    is called the *root space decomposition* of \\(\mathfrak g\\) (relative
    to \\(\mathfrak h.\\))


{{% /div %}}


At this point the reader may be forgiven for finding this definition
intimidating. We defang it thus.


{{% div class="example" %}}
 Consider \\(\mathfrak g = A\_1,\\) the Lie algebra of
\\(2 \times 2\\) matrices over \\(\mathbb R\\) with zero trace. We claim that
the subalgebra of diagonal matrices
\\(\mathfrak h = \operatorname{diag} A\_1 = \operatorname{span} (1, -1)\\) is
toral. To show this, we calculate the functionals
\\(\alpha \in \mathfrak h^\*\\) for which \\(\mathfrak g\_\alpha\\) is not the
zero algebra.

Since \\(\mathfrak h\\) is one-dimensional, an element
\\(\alpha \in \mathfrak h^\*\\) is just a mapping \\(h \mapsto ch,\\) where
\\(c \in \mathbb R.\\) So we look for scalars \\(k\\) and \\(x \in \mathfrak g\\)
such that \\([hx] = khx,\\) where \\[\begin{aligned}
khx &= k \begin{bmatrix}d & \newline & -d\end{bmatrix} \begin{bmatrix}a & b \newline c & -a\end{bmatrix} \newline
&= k\begin{bmatrix}ad & bd\newline -cd & ad\end{bmatrix}, \newline
[hx] = hx - xh &= \begin{bmatrix}d & \newline & -d\end{bmatrix} \begin{bmatrix}a & b \newline c & -a\end{bmatrix} - \begin{bmatrix}a & b \newline c & -a\end{bmatrix} \begin{bmatrix}d & \newline & -d\end{bmatrix} \newline
&= \begin{bmatrix}0 & 2bd \newline -2cd & 0 \end{bmatrix}.
\end{aligned}\\] By inspection, if \\(k \not\in \\{0, \pm 2\\},\\) there are no
nonzero satisfactory elements \\(x\\); and

1.  if \\(k = 0,\\) any satisfactory \\(x\\) has the form
    \\(\operatorname{diag}(a, -a);\\)
2.  if \\(k = 2,\\) any satisfactory \\(x\\) has the form
    \\(\begin{bmatrix} 0 & b \newline 0 & 0 \end{bmatrix};\\)
3.  if \\(k = -2,\\) any satisfactory \\(x\\) has the form
    \\(\begin{bmatrix} 0 & 0 \newline c & 0 \end{bmatrix}.\\)

Thus, \\(\Phi = \\{2, -2\\}.\\) (Remember, \\(0\\) is never a root.) Observe that
\\(\bigoplus\_{\alpha \in \\{0\\} \cup \Phi} \mathfrak g\_\alpha = \mathfrak g.\\)
Thus \\(\mathfrak h\\) is toral in \\(\mathfrak g,\\) with root spaces
\\(\mathfrak g\_{\pm 2}\\) spanned by
\\(\begin{bmatrix} 0 & 1 \newline 0 & 0 \end{bmatrix}, \begin{bmatrix} 0 & 0 \newline 1 & 0\end{bmatrix}\\)
respectively. 
{{% /div %}}



{{% div class="proposition" %}}
 Let \\(\mathfrak h\\) be a toral subalgebra of
\\(\mathfrak g,\\) and let \\(k, l \in \mathfrak h.\\) Then
\\([kl] \in Z(\mathfrak g).\\) 
{{% /div %}}



{{% div class="proof" %}}
 Let
\\(\alpha \in \Phi\\) be a root, and let \\(\mathfrak g\_\alpha\\) be its
corresponding (nonzero) root space. Fix a basis \\(\\{g\_{\alpha,i}\\}\\) of
\\(\mathfrak g\_\alpha.\\) Then by the Jacobi identity, we have
\\[\begin{equation*}
[[k, l], g\_{\alpha,i}] + [[l, g\_{\alpha, i}], k] + [[g\_{\alpha,i},k],l] = 0.
\end{equation*}\\]

We focus just on the latter two terms. Since \\(\alpha\\) is a root,
\\([h,g\_{\alpha, i}] = \alpha(h)g\_{\alpha, i}\\) for any
\\(h \in \mathfrak h,\\) and we have \\[\\begin{aligned}
[[l,g\_{\alpha,i}],k] + [[g\_{\alpha,i},k],l] & = [\alpha(l)g\_{\alpha, i}, k] - [\alpha(k)g\_{\alpha, i}, l] \newline
&= \alpha(l)[g\_{\alpha, i}, k] - \alpha(k)[g\_{\alpha, i}, l] \newline
&= -\alpha(l)\alpha(k) g\_{\alpha, i} + \alpha(k)\alpha(l)g\_{\alpha, i} = 0.
\end{aligned}\\] Thus \\([[k,l],g\_{\alpha, i}]  = 0.\\) Since this is true
for any choice of \\(\alpha,\\) \\([[k,l], g] = 0\\) for any
\\(g \in \mathfrak g.\\) Therefore \\([k,l] \in Z(\mathfrak g).\\) 
{{% /div %}}



{{% div class="corollary" %}}
 A toral subalgebra \\(\mathfrak h\\) of a semisimple
Lie algebra \\(\mathfrak g\\) is abelian. 
{{% /div %}}


At this point, we assume the following theorem.


{{% div class="theorem" %}}
 [Cartan semisimplicity criterion]
Let \\(\mathbb F\\) be an algebraically closed field of characteristic zero. Let \\(\mathfrak g\\) be a Lie algebra over \\(\mathbb F.\\)

Then \\(\mathfrak g\\) is semisimple if and only if there exists a bilinear form \\(\kappa : \mathfrak g \times \mathfrak g \to \mathbb F\\) such that
1. \\(\kappa\\) is *symmetric*: \\(\kappa(x, y) = \kappa(y, x)\\) for all \\(x, y \in \mathfrak g\\);
2. \\(\kappa\\) is *nondegenerate*: If \\(\kappa(x, y) = 0\\) for all \\(y \in \mathfrak g,\\) then \\(x = 0\\);
3. \\(\kappa([xy], z) = \kappa(x, [yz])\\) for all \\(x, y, z \in \mathfrak g.\\)

If such a form \\(\kappa\\) (called the *Cartan-Killing form* or sometimes just the *Killing form*) exists, \\(\mathfrak g\\) has a nontrivial toral subalgebra. If a toral subalgebra \\(\mathfrak h\\) of \\(\mathfrak g\\) is *maximal*, that is, not properly contained in any other toral subalgebra, we have \\(\mathfrak h = \mathfrak g\_0,\\) so that \\[\mathfrak g = \mathfrak h \oplus \bigoplus\_{a \in \Phi} \mathfrak g\_\alpha.\\] Such a maximal toral subalgebra is called a *Cartan subalgebra*, or just *CSA*.
{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972]. 
{{% /div %}}


We now present some consequences. The next theorem lists some properties
enjoyed by semisimple Lie algebras which will be needed shortly.


{{% div class="theorem" %}}
 Let \\(\mathbb F\\) be an algebraically closed field of
characteristic zero, \\(\mathfrak g\\) a semisimple Lie algebra over
\\(\mathbb F,\\) and \\(\mathfrak h\\) a CSA of \\(\mathfrak g.\\) Then the
following are true.

1.  The restriction of \\(\kappa\\) to \\(\mathfrak h \times \mathfrak h\\) is
    nondegenerate.
2.  For each \\(\alpha \in \Phi,\\) there is a unique nonzero
    \\(t\_a \in \mathfrak h\\) such that \\(\alpha(h) = \kappa(h, t\_\alpha)\\)
    for all \\(h \in \mathfrak h.\\)
3.  The dual space \\(\mathfrak h^\*\\) is (\\(\mathbb F\\)-)spanned by \\(\Phi.\\)
    \\(\alpha \in \Phi\\) if and only if \\(-\alpha \in \Phi.\\)
4.  For each \\(\alpha \in \Phi\\) and each \\(x \in \mathfrak g\_{\alpha},\\)
    \\(y \in \mathfrak g\_{-\alpha},\\) we have
    \\([xy] = \kappa(x, y)t\_\alpha.\\) If \\(x \not = 0,\\) there exists \\(y\\)
    such that \\(\kappa(x, y) \not = 0,\\) and vice versa.

{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972] §8. 
{{% /div %}}


Finally, we state that the roots indeed form a root system.


{{% div class="theorem" %}}
 Let \\(\mathfrak g\\) and \\(\mathfrak h\\) be as above. For roots \\(\alpha, \beta,\\) let
\\(\langle \alpha, \beta \rangle \coloneqq \kappa(t\_\alpha, t\_\beta).\\)
Then the following are true.

1.  \\(\langle \alpha, \alpha \rangle > 0.\\)
2.  The only scalar multiples of \\(\alpha\\) belonging to \\(\Phi\\) are
    \\(\alpha\\) and \\(-\alpha.\\)
3.  \\(\displaystyle \frac{2\langle \beta, \alpha\rangle}{\langle \alpha, \alpha \rangle} \in \mathbb Z.\\)
4.  \\(\displaystyle \beta - \frac{2\langle \beta, \alpha\rangle}{\langle \alpha, \alpha \rangle}\alpha \in \Phi.\\)
5.  \\(\langle \alpha, \beta \rangle \in \mathbb Q.\\)


{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972] §8. 
{{% /div %}}


We have the following important corollary which describes in detail the
structure of semisimple Lie algebras.


{{% div class="corollary" %}}
 Let \\(\alpha \in \Phi.\\) Then
\\(\mathfrak g\_\alpha \oplus \mathfrak g\_{-\alpha} \oplus [\mathfrak g\_\alpha, \mathfrak g\_{-\alpha}] \approx A\_1.\\)


{{% /div %}}



{{% div class="proof" %}}
 Let \\(x \in \mathfrak g\_\alpha.\\) By consequence 5 of Theorem 2.5, we can choose \\(y \in \mathfrak g\_{-\alpha}\\) such that \\(\kappa(x, y) = 2/\langle \alpha, \alpha \rangle.\\)

Set \\(h = [xy] = \kappa(x, y)t\_\alpha = \displaystyle \frac2{\langle \alpha, \alpha \rangle}t\_\alpha.\\)

Observe that \\[\begin{aligned} [hx] = \left[\frac{2}{\langle \alpha, \alpha \rangle} t\_\alpha, x\right]
= \frac{2}{\langle \alpha, \alpha \rangle} \cdot [t\_\alpha, x]
& = \frac{2}{\langle \alpha, \alpha \rangle} \cdot \alpha(t\_\alpha) x \newline
&= \frac{2}{\langle \alpha, \alpha \rangle} \cdot \kappa(t\_\alpha, t\_\alpha) x \newline
& = \frac{2}{\langle \alpha, \alpha \rangle} \cdot \langle \alpha, \alpha \rangle x  = 2x.
\end{aligned}\\] 

Similarly, \\([hy] = -2y.\\) Therefore \\(\operatorname{span}\_{\mathbb{F}} \\{x, y, h\\} \approx A\_1.\\)

We claim now that \\(x\\) spans \\(\mathfrak g\_\alpha.\\) Let \\(x'\\) be another
element of \\(\mathfrak g\_\alpha.\\) By the Jacobi identity, we have
\\[\begin{aligned}
[h,[x,x']] &= -[x, [x', h]] - [x', [h, x]] \newline
&= -[x, -\alpha(h) x'] - [x', \alpha(h) x] \newline
&= \alpha(h) [x, x'] - \alpha(h)[x', x] \newline
&= \alpha(h) [x, x'] + \alpha(h)[x, x'] \newline
&= 2\alpha(h) [x, x'] = (2\alpha)(h)[x, x'].
\end{aligned}\\] 


However, by consequence (2) of the preceding theorem, \\(2\alpha\\) is not a
root, so \\([x, x'] = 0.\\) Consider now \\([x', y] = \kappa(x', y)t\_\alpha.\\)
By the Jacobi identity we have \\[\begin{aligned}
0 = [0, y] = [[x, x'],y] &= -[[x', y],x] - [[y, x],x'] \newline
&= -[\kappa(x', y)t\_\alpha, x] - [-h, x'] \newline
&= -\kappa(x', y)[t\_\alpha, x] - [-h, x'] \newline
&= -\kappa(x', y)\kappa(t\_\alpha, t\_\alpha)x + 2x',
\end{aligned}\\] 
\\(-\kappa(x', y)\kappa(t\_\alpha, t\_\alpha) \not = 0.\\) Thus \\(x'\\) is a
scalar multiple of \\(x,\\) so
\\(\operatorname{span}\_{\mathbb F} x = \mathfrak g\_\alpha.\\) Similarly, we
have \\(\operatorname{span}\_{\mathbb F} y = \mathfrak g\_{-\alpha}.\\)
Finally, by consequence 5 of Theorem 2.5,
\\(\operatorname{span}\_{\mathbb F} h = [\mathfrak g\_{\alpha}, \mathfrak g\_{-\alpha}].\\)

Putting these together, we have that \\(x, y,\\) and \\(h\\) span
\\(\mathfrak g\_{\alpha}, \mathfrak g\_{-\alpha},\\) and
\\([\mathfrak g\_{\alpha}, \mathfrak g\_{-\alpha}]\\) respectively. So we have
\\(\mathfrak g\_\alpha \oplus \mathfrak g\_{-\alpha} \oplus [\mathfrak g\_\alpha, \mathfrak g\_{-\alpha}] \approx A\_1.\\)

{{% /div %}}



{{% div class="theorem" %}}
 \\(\Phi\\) is a root system in the sense of Definition
2.2.13. 
{{% /div %}}


{{% div class="proof" %}}
 Let
\\(E\_{\mathbb Q} \coloneqq \operatorname{span}\_{\mathbb Q}\Phi.\\) By
consequences 1 and 5 of Theorem 2.6,
\\(\langle \cdot, \cdot \rangle : E\_{\mathbb Q} \times E\_{\mathbb Q} \to \mathbb Q\\)
is a symmetric, positive-definite bilinear form. Let \\(E\\) be the
extension of \\(E\_{\mathbb Q}\\) to a vector space over \\(\mathbb R.\\) The
inner product \\(\langle \cdot, \cdot \rangle\\) then naturally extends to
an inner product on \\(\mathbb R.\\)

Furthermore, we have \\(E = \operatorname{span}\_{\mathbb R} \Phi.\\) Also:

1.  \\(\Phi\\) spans the Euclidean space \\(E = \mathbb R^{|\Phi|},\\) by
    construction;
2.  \\(0 \not \in \Phi,\\) by definition;
3.  the only scalar multiples of \\(\alpha \in \Phi\\) belonging to \\(\Phi\\)
    are \\(\pm \alpha,\\) by consequence 2 of Theorem 2.6;
4.  for \\(\alpha, \beta \in \Phi,\\)
    \\(r\_\alpha(\beta) \coloneqq \beta - \frac{2\langle \beta, \alpha \rangle}{\langle \alpha, \alpha \rangle}\alpha \in \Phi,\\)
    by consequence 4 of Theorem 2.6;
5.  for \\(\alpha, \beta \in \Phi,\\)
    \\(\frac{2\langle \beta, \alpha \rangle}{\langle \alpha, \alpha \rangle} \in \mathbb Z,\\)
    by consequence 3 of Theorem 2.6.


{{% /div %}}


So, from a semisimple Lie algebra (and a choice of Cartan subalgebra,)
we have obtained a root system. It turns out that the root system so
obtained depends only on the choice of Lie algebra. See [Humphreys 1972].

The next sections explore further the correspondence between semisimple
Lie algebras and root systems.

## Cartan matrices


{{% div class="definition" %}}
 Let \\(\Phi\\) be a rank-\\(n\\) root system with base
\\(\Delta = \\{\phi_k\\}_{k=1}^n.\\) The *Cartan matrix* of \\(\Phi\\) is the
\\(n \times n\\) matrix whose \\(ij\\)th entry is given by
\\(\langle \phi_i, \phi_j \rangle.\\) 
{{% /div %}}


Since every root system corresponds to a semisimple Lie algebra, we can
also speak of the *Cartan matrix of a Lie algebra.* In the next theorem,
we will see that the Cartan matrix encodes crucial information that
connects a given root system to its associated semisimple Lie algebra.


{{% div class="example" %}}
 From before, we know that the root system \\(\Phi\\)
associated to \\(A\_2\\) has rank 2. If we take the roots \\(\alpha, \beta\\) in
the given diagram to be unit vectors, their components are
\\[\alpha = \begin{bmatrix} 1 \newline 0\end{bmatrix},
\beta = \begin{bmatrix} -1/2 \newline \sqrt3/2\end{bmatrix}.\\] We compute
\\(\langle \alpha, \alpha\rangle = \langle \beta, \beta\rangle = 2, \langle \alpha, \beta \rangle = \langle \beta, \alpha \rangle = -1.\\)
So the Cartan matrix of \\(A\_2\\) is
\\(\begin{bmatrix} 2 & -1 \newline -1 & 2 \end{bmatrix}.\\) 
{{% /div %}}


## Some general representation theory


{{% div class="definition" %}}
 A *representation* of a Lie algebra is a
homomorphism \\(\phi : \mathfrak{g} \to gl(V)\\); that is, a linear map that
preserves the bracket.

Given a representation \\(\phi : \mathfrak g \to gl(V),\\) we make the
representing space \\(V\\) into a \\(\mathfrak g\\)-module by defining
\\(x.v = \phi(x)(v)\\) for every \\(x \in \mathfrak g,\\) \\(v \in V.\\) Observe
that for all \\(v, w \in V,\\) scalars \\(c \in \mathbb F,\\) and
\\(x, y \in \mathfrak g,\\)

1.  \\(x.(cv + w) = cx.v + x.w\\) and
2.  \\([xy].v = x.y.v - y.x.v.\\)

Conversely, if an action of \\(\mathfrak g\\) on \\(V\\) satisfies these
conditions, the mapping \\(\phi: \mathfrak g \to gl(V)\\) defined by
\\(\phi(x)(v) \coloneqq v\\) is a representation of \\(\mathfrak g.\\)

{{% /div %}}


When the target space of a representation of \\(\mathfrak g\\) is a general
linear matrix algebra, we may think of the homomorphism \\(\phi\\) as
encoding some of the structure of \\(\mathfrak g\\) into a matrix algebra.


{{% div class="definition" %}}
 The *adjoint* of an element \\(x \in \mathfrak g\\) is
the function \\(\operatorname{ad}\_x: \mathfrak g \to \mathfrak g\\) that
sends \\(y \mapsto [xy].\\) 
{{% /div %}}



{{% div class="definition" %}}
 The *adjoint representation* of a Lie algebra
\\(\mathfrak g\\) is the function
\\(\operatorname{ad} : \mathfrak g \to gl(\mathfrak g)\\) that sends
\\(x \mapsto \operatorname{ad}\_x.\\) 
{{% /div %}}



{{% div class="proposition" %}}
 For any Lie algebra \\(\mathfrak g,\\)
\\(\operatorname{ad}\\) is actually a representation. 
{{% /div %}}


{{% div class="proof" %}}
 We have to show that
\\([\operatorname{ad} x, \operatorname{ad} y] = \operatorname{ad}[xy] = \operatorname{ad}\_{[xy]}.\\)
For any \\(z \in \mathfrak g,\\)
\\(\operatorname{ad}\_{[xy]} z = [[xy]z] = -[z[xy]].\\) By the Jacobi
identity, we have \\[\begin{aligned}
-[z[xy]] &= [x[yz]] + [y[zx]] \newline
&= [x[yz] - [y[xz]] \newline
&= \[x, \operatorname{ad}\_y z\] - \[y, \operatorname{ad}\_x z\] \newline
&= \operatorname{ad}\_x (\operatorname{ad}\_y z) - \operatorname{ad}\_y (\operatorname{ad}\_x z) \newline
&= (\operatorname{ad}\_x \circ \operatorname{ad}\_y - \operatorname{ad}\_y \circ \operatorname{ad}\_x)(z) \newline
&= \[\operatorname{ad} x, \operatorname{ad} y\](z).
\end{aligned}\\] 
{{% /div %}}

Representation theory gives us another way to think of, and a much simpler way to compute, the roots of a semisimple Lie algebra. For the remainder of this section, assume \\(\mathfrak g\\) is semisimple over an algebraically closed field \\(F\\) of characteristic zero.{{% sidenote %}} Taking \\(F = \mathbb R\\) will suffice. {{% /sidenote %}}

{{% div class="proposition" %}}
 Let \\(\mathfrak h\\) be a maximal toral subalgebra
of \\(\mathfrak g.\\) The roots of \\(\mathfrak g\\) with respect to
\\(\mathfrak h\\) are precisely the nonzero functionals
\\(\phi : \mathfrak h \to F\\) that annihilate
\\(\det(\operatorname{ad} h - \phi(h)I),\\) where \\(I \in gl(\mathfrak g)\\)
denotes the identity transformation. 
{{% /div %}}



{{% div class="proof" %}}
 Suppose \\(\phi\\) is a root. By definition, \\(\phi\\) is not identically zero,
and there is a nonzero \\(x \in \mathfrak g\\) such that
\\([hx] - \phi(h)x = 0.\\) Since
\\([hx] - \phi(h)x = (\operatorname{ad} h - \phi(h)I)x,\\) and \\(x \not = 0,\\)
we must have \\(\det(\operatorname{ad} h - \phi(h)I) = 0.\\)

Suppose \\(\phi \not = 0\\) and \\(\det(\operatorname{ad} h - \phi(h)I) = 0.\\) Then, since the matrix \\(\operatorname{ad} h - \phi(h)I\\) is singular,
there is a nonzero \\(x \in \mathfrak g\\) such that
\\((\operatorname{ad} h - \phi(h)I)x = 0\\); which is to say,
\\([hx] - \phi(h)x = 0.\\) Hence, \\(\phi\\) is a root.
{{% /div %}}


In the language of §2.2.9 below, this proposition says that roots are
the "weights" of the adjoint representation, and thus the root
spaces are the "weight spaces."


{{% div class="example" %}}
 We shall compute the roots of \\(A\_1\\) again (with
respect to its diagonal subalgebra) using the above proposition.

For any element of \\(\operatorname{diag} A\_1,\\) say
\\(h = \operatorname{diag}(d, -d),\\) \\(\operatorname{ad} h\\) is the linear
map that sends
\\[ x = \begin{bmatrix} a & b \newline c & -a\end{bmatrix} \mapsto [hx] = \begin{bmatrix} 0 & -2db \newline 2dc & 0 \end{bmatrix}.\\]
So \\(\operatorname{ad} h = \operatorname{diag}(0, -2d, d),\\) and the
nonzero functionals that annihilate the characteristic polynomial of
\\(\operatorname{ad} h\\) are exactly \\(\phi\_1(h) = -2d,\\) \\(\phi\_2(h) = 2d.\\)

{{% /div %}}



{{% div class="example" %}}
 Using the same method, we shall compute the roots of
\\(A\_2\\) with respect to its diagonal subalgebra.

An element of \\(\operatorname{diag} A\_2\\) looks like
\\(h = \operatorname{diag}(h\_1, h\_2, -(h\_1+h\_2)).\\) So
\\(\operatorname{ad} h : \mathbb R^8 \to \mathbb R^8\\) is the linear map
that sends \\[\begin{aligned}
x = \begin{bmatrix} a & b & c \newline d & e & f \newline g & i & -(a + e)\end{bmatrix} \mapsto [hx] = \begin{bmatrix}0 & (h\_1 - h\_2)b & (2h\_1 + h\_2)c \newline (h\_2 - h\_1)d & 0 & (h\_1 + 2h\_2)f \newline (-2h\_1 - h\_2)g & (-h\_1-2h\_2)i & 0\end{bmatrix}.
\end{aligned}\\]

We can put this in matrix form:
\\[\operatorname{ad} h = \operatorname{diag} \begin{bmatrix} 0\newline h\_1 - h\_2\newline 2h\_1 + h\_2\newline h\_2 - h\_1\newline 0\newline h\_1 + 2h\_2\newline -2h\_1 - h\_2\newline -h\_1 - 2h\_2\end{bmatrix}.\\]

So the roots of \\(A\_2\\) are the linear functionals
\\(\phi\_i : \mathbb R^2 \to \mathbb R\\) for which \\(\phi\_i(h\_1, h\_2)\\)
annihilates this matrix\'s characteristic polynomial. In vector form,
they are as follows:
\\[\begin{bmatrix} 1 \newline -1 \end{bmatrix}, \begin{bmatrix} 2 \newline 1 \end{bmatrix}, \begin{bmatrix} -1 \newline 1 \end{bmatrix}, \begin{bmatrix} 1 \newline 2 \end{bmatrix}, \begin{bmatrix} -2 \newline -1 \end{bmatrix}, \begin{bmatrix} -1 \newline -2 \end{bmatrix}.\\]

{{% /div %}}



{{% div class="marginfigure" %}}
{{% figure src="/images/fake-a2.png" caption="Figure 2.3: The not-quite-a-root-system given by the roots of \\(A\_2\\) with respect to \\(\operatorname{diag} A\_2.\\) " %}}
{{% /div %}}


Plotting these gives Figure 2.3, which is not a root system taken as-is.
(Why?) There exists an invertible linear transformation, which we leave
to the reader to work out, that maps this picture onto the root system
\\(A\_2\\) given previously. In fact this is true more generally, as we will
see.

## Serre relations and Chevalley generators

The *Serre relations* provide a way to reconstruct a Lie algebra from
its root system. In a sense, they encode the construction of a root
system from a Lie algebra given previously into a presentation of that
Lie algebra by generators and relations.


{{% div class="theorem" %}}
[Serre]
Let \\\(\Phi\\\) be a rank-\\(n\\) root system with base \\(\Delta = \\{\phi\_i\\}\_{i=1}^n.\\) Then the Lie algebra with generators \\(\\{x\_i, y\_i, h\_i\\}\_{i=1}^n\\) subject to the relations
1. \\([h\_i, h\_j] = 0\\);
2. \\([x\_i, y\_j] = \mathbf 1\_{i=j} h\_i\\);
3. \\([h\_i, x\_j] = \langle \phi\_j, \phi\_i\rangle x\_j\\);
4. \\([h\_i, y\_j] = -\langle \phi\_j, \phi\_i\rangle y\_j\\);
5. \\((\operatorname{ad} x\_i)^{1-\langle \phi\_j, \phi\_i \rangle}(x\_j)  = (\operatorname{ad} y\_i)^{1-\langle \phi\_j, \phi\_i \rangle}(y\_j) =0\\)

is semisimple and has root system \\(\Phi.\\)

{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972] §18. 
{{% /div %}}


Due to a theorem of Chevalley, every semisimple Lie algebra can be
generated in this manner. Thus, the elements of the generating set
\\(\\{x\_i, y\_i, h\_i\\}\_{i=1}^n\\) are usually called the *Chevalley
generators*.

## Combinatorial structure of semisimple Lie algebra representations\*

*This section may be skipped on a first reading. It bridges the
preceding material with papers such as [Donnelly 2003].*{{% sidenote %}}
Robert G. Donnelly. Extremal properties of bases for representations of
semisimple Lie algebras. *Journal of Algebraic Combinatorics*, 17, 2003.
{{% /sidenote %}}

Let \\(\mathfrak g\\) be semisimple over an algebraically closed field
\\(\mathbb F\\) of characteristic zero. Fix a Cartan subalgebra
\\(\mathfrak h\\) of \\(\mathfrak g,\\) and let \\(\Phi\\) be the corresponding root
system of rank \\(n = \operatorname{dim} \mathfrak h.\\) Let
\\(\Delta = \\{\alpha\_i\\}\_{i=1}^n\\) be a base for \\(\Phi,\\) and let
\\(\\{x\_i, y\_i, h\_i\\}\_{i=1}^n\\) be the corresponding set of Chevalley
generators of \\(\mathfrak g.\\)

In the \\(n\\)-dimensional Euclidean space of which \\(\Phi\\) is a basis, let
\\(\varepsilon = \\\{\varepsilon\_i\\\}\_{i=1}^n\\) be the dual basis to \\(\Phi.\\)
Then if \\(M\\) is the associated Cartan matrix, we have
\\(\varepsilon = M\Phi.\\)


{{% div class="definition" %}}
 Let \\(\Lambda\\) be the \\(\mathbb Z\\)-span of
\\(\varepsilon\\); that is, the set of all integral linear combinations of
\\(\varepsilon\_i.\\) Elements of \\(\Lambda\\) are called *weights*, and
\\(\Lambda\\) itself is called the *weight lattice*. A weight
\\(\lambda \in \Lambda\\) is called *dominant* if it is a *positive*
integral linear combination of \\(\varepsilon\_i.\\) 
{{% /div %}}



{{% div class="definition" %}}
 Make a finite-dimensional vector space \\(V\\) over
\\(\mathbb F\\) into a \\(\mathfrak g\\)-module as stated in Definition 18.
A subspace \\(W \leq V\\) is called \\(\mathfrak g\\)-*stable* (sometimes
*\\(\mathfrak g\\)-invariant* if \\(gW \subseteq W\\) for any
\\(g \in \mathfrak g.\\) If \\(v \in V\\) is nonzero, \\(\mathfrak g . v\\) denotes
the smallest \\(\mathfrak g\\)-stable subspace containing \\(v.\\) 
{{% /div %}}


With the above setup, the following two theorems specify the structure
of \\(V.\\) 
{{% div class="theorem" %}}
 For a weight \\(\lambda \in \Lambda,\\) let the
*\\(\lambda\\)-weight space* of \\(V\\) be given by
\\[V_\lambda \coloneqq \\{v \in V : h_i.v = \langle \lambda, \alpha_i^\vee\rangle v\\}.\\]
Then \\(V = \bigoplus_{\lambda \in \Lambda} V_\lambda.\\) Furthermore, for
any \\(v \in V_\lambda,\\) we have \\(x_i.v \in V_{\lambda + \alpha_i}\\) and
\\(y_i.v \in V_{\lambda - \alpha_i}.\\) 
{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972] §21. 
{{% /div %}}


Let \\(\Pi(V) \coloneqq \\{\lambda \in \Lambda : \operatorname{dim} V\_\lambda > 0\\}.\\)
We call the equality \\(V = \bigoplus\_{\lambda \in \Pi(V)} V\_\lambda\\) the
*weight space decomposition* of \\(V.\\) Any basis of \\(V\\) whose vectors lie
in \\(\bigcup\_{\lambda \in \Pi(V)}\\) is called a *weight basis.*


{{% div class="theorem" %}}
 There are independent vectors \\(\\{v\_i\\}\_{i=1}^n\\) with
\\(v\_i \in V\_{\lambda\_i}\\) such that 
1. \\(v\_i\\) is "maximal," in the sense \\(x\_i.v\_j = 0\\) for each \\(i, j \in [n]\\) and
2. \\(V = \bigoplus\_{i=1}^n \mathfrak g . v\_i.\\)

If \\(V = \mathfrak g.v\_i,\\) we say \\(V\\) is *irreducible.* In this case, if \\(v\_i'\\) is any other maximal vector, \\(v\_i' = cv\_i\\) for some scalar \\(c,\\) and if \\(W = \mathfrak g .w\_i\\) is another irreducible \\(\mathfrak g\\)-module, then \\(V \approx W\\) are isomorphic \\(\mathfrak g\\)-modules.

Let \\(\mathfrak g(\lambda)\\) be an indeterminate, irreducible \\(\mathfrak g\\)-module with maximal vector of dominant weight \\(\lambda.\\) The preceding theorem assures that we can write \\(V \approx \bigoplus\_{i = 1}^n \mathfrak g(\lambda\_i).\\) This decomposition completely determines the module, up to isomorphism.

{{% /div %}}



{{% div class="proof" %}}
 See [Humphreys 1972] §21. 
{{% /div %}}


We combinatorialize this information as follows.


{{% div class="definition" %}}
 Let \\(\\{v\_r\\}\_{r \in R}\\) be a weight basis for a
\\(\mathfrak g\\)-module \\(V,\\) indexed by the set \\(R,\\) as above. Let
\\(p, q \in R,\\) let \\(i \in [n],\\) and write \\[ x\_i.v\_p = \sum\_{r \in R} c\_{r,p}v\_r, \qquad y\_i.v\_q = \sum\_{r \in R} d\_{r,q}v\_r.\\]
The *supporting graph* for \\(V\\) is the edge-colored directed graph
with vertex set \\(R\\) such that for any \\(p, q \in R,\\) \\(p \overset{i}\to s\\)
provided that in the above decomposition, \\(c\_{q,p}\\) and \\(d\_{p,q}\\) are
not both zero. If we also associate the edge coefficients \\(c\_{q,p}\\) and
\\(d\_{p,q}\\) with each edge, then we have a *representation diagram* for
\\(V.\\)

For each \\(r \in R,\\) we set \\(\omega(r) = \lambda\\) if \\(v\_r \in V\_\lambda.\\)

{{% /div %}}



{{% div class="theorem" %}}
 Consider \\(R\\) as the Hasse diagram of a ranked poset.
Then

1.  If \\(r \overset{i}\to s\\) in \\(R,\\) then
    \\(\omega(s) - \omega(r) = \alpha\_i.\\)
2.  \\(\langle \omega(r), \alpha\_i^\vee \rangle = 2\rho\_i(r) - l\_i(r),\\)
    where \\(\rho\_i(r),\\) \\(l\_i(r)\\) are respectively the rank of \\(r\\) within
    its \\(i\\)-component and the length of that \\(i\\)-component.
3.  Define the weight-generating function of \\(R\\) as

\\[ WGF(R; \mathbf z) \coloneqq \sum\_{r \in R} \mathbf z^{\omega(r)} = \sum\_{r \in R} \prod\_{i=1}^n z\_i^{\langle \omega(r), \alpha\_i^\vee \rangle}.\\]
Then the \\(\mathfrak g\\)-module \\(V\\) is completely determined, up to
isomorphism, by the weight-generating function of its supporting graph
\\(R.\\) 
{{% /div %}}
 
{{% div class="proof" %}}
 See [Donnelly 2003] and [Donnelly 2018].{{% sidenote %}}Robert G. Donnelly. [Poset models for Weyl group analogs of symmetric functions and Schur functions](http://arxiv-export-lb.library.cornell.edu/abs/1811.10643?context=math.CO), 2018.{{% /sidenote %}}
{{% /div %}}
