---
title: Lattice theory
description: Rudiments of combinatorial lattice theory.
date: 2020-11-01
completion_status: complete
epistemic_status: confident
weight: 3
---

This section and the next introduce the mathematics necessary to read [Chapter 3](/blog/thesis/supporting-graphs). The
main results draw from combinatorial lattice theory and the
representation theory of Lie algebras.

In this section we present a number of standard definitions and notions
concerning posets and lattices, in particular the *diamond-colored
distributive lattices* (DCDLs). DCDLs provide the setting for the
graph-theoretic arguments and algorithms appearing in the sequel.

The primary references for this section are [Donnelly 2018]{{% sidenote %}}Robert G. Donnelly. *[Poset models for Weyl group analogs of symmetric functions and Schur functions](http://arxiv-export-lb.library.cornell.edu/abs/1811.10643?context=math.CO)*, 2018. {{% /sidenote %}} and [Stanley 2011].{{% sidenote %}}Richard P. Stanley. *Enumerative Combinatorics, Volume 1*, 2nd ed., 2011.{{% /sidenote %}}

{{% div class="definition" %}}
 Let \\(P\\) be a set. A *partial order* is a binary
relation \\(\leq\\) on \\(P\\) satisfying the following axioms for all
\\(a, b, c \in P.\\)

1.  \\(\leq\\) is *reflexive*: \\(a \leq a\\);
2.  \\(\leq\\) is *transitive*: \\(a \leq b\\), \\(b \leq c \implies a \leq c\\);
    and
3.  \\(\leq\\) is *antisymmetric*: \\(a \leq b, b \leq a \implies a = b.\\)

A set \\(P\\) equipped with a partial order \\(\leq\\) is called a *partially
ordered set*, or just *poset*. 
{{% /div %}}

{{% div class="definition" %}}
 A *total order* on a set \\(P\\) is a partial order
\\(\leq\\) in which, for all \\(a, b \in P\\), either \\(a \leq b\\) or \\(b \leq a.\\)
{{% /div %}}

{{% div class="definition" %}}
 Let \\(P\\) be a poset. If \\(a, b \in P\\), and for any
\\(x \in P\\), \\(a \leq x, x \leq b \implies x \in \\{a, b\\},\\) we say \\(b\\)
*covers* \\(a\\) and write \\(a \to b.\\) 
{{% /div %}}

{{% div class="definition" %}}
 To any poset \\(L\\) we may associate a directed graph
\\(H\\), called a *Hasse diagram*, whose vertex set is \\(L\\) and whose edge
set is given by the covering relation; that is, there is an edge
\\(a \to b\\) in \\(H\\) only if \\(a \to b\\) in \\(L.\\) 
{{% /div %}}

In the sequel we shall speak of lattices and their Hasse diagrams
interchangeably.

{{% div class="definition" %}}
 Given two posets \\(P\\), \\(Q\\), with respective orders
\\(\leq\_P\\), \\(\leq\_Q\\), we may define their *Cartesian product*
\\(P \boxtimes Q\\) as a poset in its own right by equipping the set
\\(P \boxtimes Q = \\{(p, q): p \in P, q \in Q\\}\\) with the *product order*
\\(\leq\_{P \boxtimes Q}\\), which is defined so that
\\((p\_1, q\_1) \leq\_{P \boxtimes Q} (p\_2, q\_2)\\) iff \\(p\_1 \leq\_P p\_2\\) and
\\(q\_1 \leq\_Q q\_2.\\) 
{{% /div %}}

Note that \\((p\_1, q\_1) \to (p\_2, q\_2)\\) in \\(P \boxtimes Q\\) iff
\\(p\_1 \to p\_2\\) in \\(P\\) and \\(q\_1 = q\_2\\) or vice versa; that is, the Hasse
diagram of the product is the Cartesian product of the Hasse diagrams of
its components.

{{% div class="definition" %}}
 An element of a poset \\(m \in P\\) is *maximal* if
\\(m \leq x \implies x = m\\), and *maximum* if \\(x \leq m\\) for all
\\(x \in P.\\) The dual notions (*minimal*, *minimum*) are apparent. We
represent the maximum (minimum) element of the poset \\(P\\), if it exists,
by \\(\top\_P\\) (\\(\bot\_P.\\)) 
{{% /div %}}

{{% div class="definition" %}}
 A finite poset is said to be *ranked* if there
exists a function \\(\rho : P \to \mathbb{N} \cup \\{0\\}\\) such that

1.  for any \\(a, b \in L\\), \\(\rho(b) - \rho(a) = 1\\) whenever \\(a \to b\\);
2.  if \\(x \in P\\) is minimal, \\(\rho(x) = 0.\\)

For any natural number \\(n\\), the \\(n\\)th *rank* of a ranked poset
\\((P, \rho)\\) is the preimage \\(\rho^{-1}[n].\\) 
{{% /div %}}

{{% div class="definition" %}}
 The *height* of a finite ranked poset is
\\(h(L) = \sup\_{x \in L} \rho(x).\\) 
{{% /div %}}

{{% div class="definition" %}}
 The *rank-generating function* of a ranked poset
is the formal power series
\\[RGF(L; q) = \sum\_{x \in L} q^{\rho(x)} = \sum\_{n=0}^\infty \left\vert \rho^{-1}[n]\right\vert q^n.\\]

{{% /div %}}

{{% div class="definition" %}}
 Given a poset \\(P\\), a *weight function*
\\(\mathbf{\omega} : P \to \mathbb{Z}^n\\) assigns to each poset element \\(x\\)
an \\(n\\)-tuple of integer *weights*
\\(\mathbf{\omega}(x) = [\omega\_1(x), \quad \dots, \quad \omega\_n(x)].\\)

{{% /div %}}

{{% div class="definition" %}}
 For a given poset \\(P\\) and weight function
\\(\mathbf\omega : P \to \mathbb Z^n\\), the *weight-generating function* of
a poset is the formal Laurent series
\\[WGF(L; \mathbf{z}) = \sum\_{x \in L} \mathbf{z}^{\mathbf{\omega}(x)} = \sum\_{x \in L} \prod\_{i = 1}^n z\_i^{\omega\_i(x)}.\\]
{{% /div %}}

{{% div class="definition" %}}
 An *order ideal* (sometimes *down-set* or *lower
set*) of a poset \\(P\\) is a set \\(I \subseteq P\\) such that for any
\\(x \in P\\), \\(y \in I\\), if \\(x \leq y\\) then \\(x \in I.\\) 
{{% /div %}}

In finite posets, order ideals can be uniquely identified with their
maximal elements; if \\(I \subseteq P\\) is an order ideal, \\(M \subseteq I\\)
its set of maximal elements, then
\\(I = \bigcup\_{m \in M} \\{x \in P : x \leq m\\}.\\)

{{% div class="definition" %}}
 A *lattice* \\(L\\) is a partially ordered set such
that for any \\(a, b \in L\\),

1.  the set \\(\\{x \in L: x \leq a, x\leq b \\}\\) has a maximum element
    \\(a \wedge b\\), and
2.  the set \\(\\{x \in L: a \leq x, b\leq x \\}\\) has a minimum element
    \\(a \vee b.\\)

The symbols \\(\wedge\\), \\(\vee\\) are read as \"meet\" and \"join\"
respectively. 
{{% /div %}}

{{% div class="definition" %}}
 A lattice \\(L\\) is *distributive* if for any
\\(a, b, c \in L\\), we have
\\((a \wedge b) \vee c = (a \vee c) \wedge (b \vee c),\\) or equivalently,
\\((a \vee b) \wedge c = (a \wedge c) \vee (b \wedge c);\\) that is, if meet
distributes over join, or vice versa. 
{{% /div %}}

{{% div class="definition" %}}
 Let \\(P\\) be a poset. The poset \\(J(P)\\) is the set of
all order ideals of \\(P\\) ordered by containment. 
{{% /div %}}

{{% div class="proposition" %}}
 For any poset \\(P\\), \\(J(P)\\) is a distributive
lattice. 
{{% /div %}}

{{% div class="proof" %}}
 To show \\(J(P)\\) is a lattice, let
\\(I, J \subseteq P\\) be order ideals of \\(P.\\) We claim
\\(I \vee J = I \cup J\\) and \\(I \wedge J = I \cap J.\\)

First we show that \\(I \cup J\\), \\(I \cap J\\) are actually order ideals.
Suppose \\(x \in I \cup J\\) and \\(y \leq x.\\) Without loss of generality
assume \\(x \in I.\\) Then since \\(I\\) is an order ideal,
\\(y \in I \subset I \cup J.\\)

Similarly, suppose \\(x \in I \cap J\\) and \\(y \leq x.\\) Then \\(x \in I\\) and
\\(x \in J\\), so \\(y \in I\\), \\(y \in J.\\) Thus \\(y \in I \cap J.\\)

Now we must show \\(I \cup J = I \vee J.\\) Suppose \\(K\\) is an order ideal of
\\(P\\) such that \\(I \subset K\\), \\(J \subset K.\\) Then clearly
\\(I \cup J \subset K.\\) Thus \\(I \cup J\\) is the minimum element of the set
\\(\\{K \in J(P) : K \leq I, K \leq J\\}.\\)

Similarly, if \\(K\\) is an order ideal of \\(P\\) such that \\(K \subset I\\),
\\(K \subset J\\), then \\(K \subset I \cap J.\\) Thus \\(I \cap J\\) is the maximum
element of the set \\(\\{K \in J(P) : I \leq K, J \leq K\\}.\\)

Therefore \\(J(P)\\) is a lattice. Showing that \\(J(P)\\) is distributive
amounts to proving that intersections distribute over unions and vice
versa, which is well-known. 
{{% /div %}}

In fact, a sort of converse holds; any finite distributive lattice is
representable as \\(J(P)\\) for some poset \\(P.\\)

{{% div class="definition" %}}
 An element \\(x \in L\\) is said to be
*join-irreducible* if \\(x \not = \min L\\) and \\(x\\) cannot be written as
\\(u \vee v\\), where \\(u,v \not = x.\\) 
{{% /div %}}

{{% div class="proposition" %}}
 In a finite lattice \\(L\\), an element \\(x\\) is
join-irreducible iff it covers exactly one element. 
{{% /div %}}

{{% div class="proof" %}}
 *If*: By contraposition; if \\(x\\) covers distinct
elements \\(u, v \in L\\), then \\(x = u \vee v\\), so \\(x\\) is not
join-irreducible. If \\(x\\) covers zero elements of \\(L\\), then \\(x = \min L\\)
and so is not join-irreducible.

*Only if*: Suppose \\(x\\) covers exactly one element \\(y \in L.\\) Then
clearly \\(x \not= \min L.\\) Now suppose contrariwise that \\(x = u \vee v\\),
where \\(u, v \not = x.\\) Since \\(u, v \leq x\\), we must have \\(u, v \leq y.\\)
But then \\(u \vee v = y\\), which is a contradiction. 
{{% /div %}}

{{% div class="definition" %}}
 We denote the subposet of all join-irreducible
elements of \\(L\\), with order induced by \\(L\\), by \\(j(L).\\) 
{{% /div %}}

The following theorem is called the Fundamental Theorem for Finite
Distributive Lattices (or *FTFDL*) by [Stanley 2011].{{% sidenote %}}Richard P. Stanley. *Enumerative Combinatorics, Volume 1*, 2nd ed., 2011.{{% /sidenote %}}


{{% div class="theorem" %}}
\[Birkhoff\] For any finite poset \\(P\\),
\\(j(J(P)) \approx P.\\) For any finite distributive lattice \\(L\\), \\(J(j(L))\\)
is order isomorphic to \\(L.\\) 
{{% /div %}}

The \"function\"{{% sidenote %}} We stop short of defining these as functions for technical reasons; strictly speaking, the \"set\" of all posets is actually a proper class.  {{% /sidenote %}}\\(J\\) maps order ideals of \\(P\\) to elements in \\(L\\);
the \"function\" \\(j\\) goes the other way. Thus, for \\(I \subseteq P\\),
\\(x \in L\\), we can consider \\(J(I) \in L\\) and \\(j(x) \subseteq P.\\)

The preceding theorem assures that every finite distributive lattice is
ranked, viz. \\(\rho(x) = \vert j(x) \vert.\\) It follows that for any two
elements \\(x, y \in L\\) with \\(x \leq y\\),
\\(\rho(y) - \rho(x) = \vert j(y) \setminus j(x) \vert.\\)

## Colors and components

{{% div class="definition" %}}
 A \\(k\\)-*coloring* of a poset \\(P\\) is a function
\\(c : P \to (\mathbb{N} \cap [1, k]).\\) We say \\(P\\) is *colored by* \\(c.\\)

{{% /div %}}

{{% div class="definition" %}}
 Let a poset \\(P\\) be colored by some function \\(c\\),
and consider the Hasse diagram \\(H\\) of \\(J(P)\\) as a directed graph. This
graph has an edge from order ideal \\(I\\) to order ideal \\(J\\) iff
\\(J = I \cup \\{v\\}\\) for some \\(v \in P.\\) Thus we may naturally color the
edge \\(I \to J\\) by \\(c(v).\\) When we regard the edges of \\(J(P)\\) as being
colored (by \\(c\\)) in this way, we shall call it a *diamond-colored
distributive lattice*, or just a *DCDL.* 
{{% /div %}}

{{% figure class="marginfigure" src="/images/diamond.png" caption="A typical diamond." %}}
{{% div class="definition" %}}
 A *diamond* of a distributive lattice is the
sublattice induced by four elements \\(w, x, y, z\\) such that
\\(w \to x \to z\\), \\(w \to y \to z.\\) In the Hasse diagram, we say the edge
\\(w \to x\\) is *parallel to* \\(y \to z.\\) Similarly, \\(w \to y\\) is parallel
to \\(x \to z.\\) (See Figure 2.1.) 
{{% /div %}}


We may regard parallelism as being naturally transitive; then the
parallel edges of any DCDL fall into "monochromatic" equivalence
classes.

{{% div class="proposition" %}}
 In a DCDL, parallel edges have the same color.

{{% /div %}}

{{% div class="proof" %}}
 Let \\(L\\) be a DCDL colored by \\(c\\), and let \\(w, x, y, z\\)
be the vertices of a diamond, identified as in the above definition.
Consider the order ideals \\(j(w), j(z).\\) The set
\\(j(z) \setminus j(w) \subset P\\) has two elements \\(u, v.\\) Without loss of
generality, write \\(j(x) = j(w) \cup \\{ u \\}\\) and
\\(j(y) = j(w) \cup \\{ v \\}.\\) Then
\\(j(z) = j(x) \cup \\{v\\} = j(y) \cup \\{u\\}.\\) Thus the edges \\(w\to x\\) and
\\(y \to z\\) have color \\(c(u)\\) while the other two edges have color \\(c(v).\\)

{{% /div %}}

{{% div class="definition" %}}
 Let \\(L\\) be a DCDL whose edges are colored by
\\([n]\\), and let \\(k \in [n].\\) A \\(k\\)-*monochromatic component* of \\(L\\) or
just \\(k\\)-*component* is a subset \\(C \subset L\\) such that

1.  \\(C\\) is a subposet of \\(L\\) under the induced order;
2.  if \\(x \to y\\) in \\(C\\), then \\(x \to y\\) in \\(L\\);
3.  \\(C\\) is maximal with respect to the property that all edges have
    color \\(k.\\)


{{% /div %}}

Next, we prove the (nontrivial) fact that any \\(k\\)-component of a DCDL
has a distributive lattice structure. The following definition, which
describes the \"preimage\" under \\(J\\) of a \\(k\\)-component, will be
necessary.

{{% div class="definition" %}}
 Let \\(P\\) be a poset with vertices colored by \\([n]\\),
and let \\(k \in [n].\\) A *\\(k\\)-subordinate* of \\(P\\) is a subset
\\(S \subseteq P\\) such that

1.  \\(S\\) is a subposet of \\(P\\) under the induced order;
2.  all elements of \\(S\\) have color \\(k\\);
3.  there exist order ideals \\(I, J \subset P\\) where no maximal element
    of \\(I\\) has color \\(k\\) and no minimal element of \\(P \setminus J\\) has
    color \\(k\\) and \\(S = J \subset I.\\)

We say that \\(I\\) and \\(J\\) are *bounding ideals* for \\(S\\); \\(I\\) is *lower
bounding* and \\(J\\) is *upper bounding.* 
{{% /div %}}

The next proposition establishes a one-to-one correspondence between \(k\)-subordinates of a poset \(P\) and \(k\)-components of its corresponding lattice \(L = J(P).\)
{{% div class="proposition" %}}
 Let \\(L = J(P)\\) be a DCDL. Let \\(k\\) be an edge or vertex color.

1.  Let \\(C\\) be a \\(k\\)-component of \\(L.\\) Then \\(C\\) is a (distributive)
    sublattice of \\(L\\), \\(S = \top_C \setminus \bot_C\\) is a
    \\(k\\)-subordinate of \\(P\\) with bounding ideals \\(\top_C\\) and \\(\bot_C\\),
    and \\(C \approx J(S).\\)
2.  Let \\(S\\) be a \\(k\\)-subordinate of \\(P\\) with lower bounding ideal \\(I\\)
    and upper bounding ideal \\(J.\\) Then \\(I\\) and \\(J\\) are the minimum and
    maximum elements of some \\(k\\)-component \\(C \subset L\\), and
    \\(j(C) \approx S.\\)

{{% /div %}}


{{% div class="proof" %}}
 See [Donnelly 2018],{{% sidenote %}}Robert G. Donnelly. *[Poset models for Weyl group analogs of symmetric functions and Schur functions](http://arxiv-export-lb.library.cornell.edu/abs/1811.10643?context=math.CO)*, 2018. {{% /sidenote %}} Proposition 13 and Theorem 14. 
{{% /div %}}

{{% div class="proposition" %}}
 Let \\(C\\) be a \\(k\\)-component of \\(L.\\) Then \\(C\\) can
be written as a Cartesian product of chains if and only if its
corresponding \\(k\\)-subordinate \\(S \subseteq j(L)\\) can be written as a
disjoint union of chains. 
{{% /div %}}

{{% div class="proof" %}}
 *If:* Suppose
\\(S \subseteq P = j(L)\\) can be written as a disjoint union of chains:
\\(S = \bigsqcup_{i=1}^n C_i.\\) We make the following claims.

1.  \\(C \approx J(S) = J(\bigsqcup_{i=1}^n C_i).\\) This follows from the
    FTFDL and the preceding proposition.
2.  \\(J(\bigsqcup_{i=1}^n C_i) = \boxtimes_{i=1}^n J(C_i).\\) To see
    this, note that every order ideal of \\(\bigsqcup_{i=1}^n C_i\\)
    corresponds uniquely to a choice of at most one element from each
    \\(C_i.\\)
3.  Each \\(J(C_i)\\) is a chain with \\(|J(C_i)| = |C_i| + 1.\\)

*Only if:* Since the correspondences between order ideals of \\(S\\) and
choices of elements from each \\(C_i\\) and between \\(S\\) and \\(C\\) are both
one-to-one, this proof reverses. 
{{% /div %}}

## Incremental lattices

This section characterizes distributivity in a way more genial to our
needs.

{{% div class="definition" %}}
 The *\\(n\\)-dimensional integer lattice*
\\(\mathbb Z^n\\) is the set of all integer \\(n\\)-tuples ordered elementwise.

{{% /div %}}

If \\(\mathbf x, \mathbf y \in \mathbb Z^n\\), then
\\(\mathbf x \vee \mathbf y\\) (resp. \\(\mathbf x \wedge \mathbf y\\)) is given
by the elementwise maximum (resp. minimum) of \\(\mathbf x\\) and
\\(\mathbf y.\\)

{{% div class="lemma" %}}
 Any sublattice of \\(\mathbb Z^n\\) is distributive.
{{% /div %}}

{{% div class="proof" %}}
 It suffices to show that, for
\\(x, y, z \in \mathbb Z\\), we have
\\[\min\\{\max\\{x, y\\}, \max \\{x, z\\}\\} = \max\\{x, \min\\{y, z\\}\\}.\\] By
symmetry we need only check the cases \\(x \leq y \leq z,\\)
\\(y \leq x \leq z,\\) \\(y \leq z \leq x.\\) This verification is left to the
reader. 
{{% /div %}}

{{% div class="definition" %}}
 A lattice \\(L\\) is *incremental* if there is an
injective homomorphism \\(\phi: L \to \mathbb Z^n\\) for some \\(n.\\) We say
that \\(L\\) *embeds into* \\(\mathbb Z^n\\) and call the function \\(\phi\\) an
*embedding.* 
{{% /div %}}

{{% div class="proposition" %}}
 A finite lattice is incremental if and only if it
is distributive. 
{{% /div %}}

{{% div class="proof" %}}
 *If.* Suppose \\(L\\) is a
finite distributive lattice. By the FTFDL, \\(L\\) is the lattice of order
ideals of some poset \\(P = j(L).\\) Write the vertex set of \\(P\\) as a union of disjoint chains, say
\\(P = \bigcup{i=1}^n C\_i = \bigcup\_{i=1}^n \\{c\_{i, k}\\}\_k,\\) where
\\(c\_{i, 1} \to c\_{i, 2}\to \dots\\)

Now define \\(\phi : L \to \mathbb Z^n\\) as follows: for each \\(x \in L\\) and
\\(i = 1, \dots, n\\), the \\(i\\)th component of \\(\phi(x)\\) is
\\(\phi(x)\_i = |C\_i \cap j(x)|.\\) It is apparent that this value is the
maximum \\(k = 1, 2, \dots\\) for which \\(c{i,k} \in j(x)\\), or \\(0\\) if \\(C\_n\\)
and \\(j(x)\\) are disjoint.

Since \\(P = j(L)\\) is finite, \\(\phi\\) is well-defined. We make the
following claims.

1.  \\(\phi\\) is injective. Suppose \\(\phi(x) = \phi(y)\\); then the maximal
    elements of \\(j(x)\\) and \\(j(y)\\) are the same, so \\(x = y.\\)
2.  \\(\phi\\) is a homomorphism. Let \\(x, y \in L.\\) Then for any \\(i\\),

\\[\begin{aligned}
\phi(x \vee y)i &= |C\_i \cap j(x \vee y)| \newline
&= |Ci \cap (j(x) \cup j(y))| \newline
&= |(Ci \cap j(x)) \cup (C\_i \cap j(y))| \newline
&= \max\\{|Ci \cap j(x)|, |C\_i \cap j(y)|\\} \newline
&= \max\\{\phi(x)i, \phi(y)\_i\\}.
\end{aligned}\\]

An analogous argument shows that
\\(\phi(x \wedge y)\_i = \min\\{\phi(x)\_i, \phi(y)\_i\\}.\\)


*Only if.* Suppose
\\(L\\) is a finite incremental lattice. Let \\(\phi : L \to \mathbb Z^n\\) be
an injective homomorphism. Suppose contrariwise that \\(L\\) is not
distributive. Then there exist \\(x, y, z \in L\\) so that
\\((x \vee y) \wedge (x \vee z) \not= x \vee (y \wedge z).\\) Since \\(\phi\\)
is injective, we must have
\\(\phi((x \vee y) \wedge (x \vee z)) \not= \phi(x \vee (y \wedge z)).\\)
Since \\(\phi\\) is a homomorphism, we have
\\((\phi(x) \vee \phi(y)) \wedge (\phi(x) \vee \phi(z)) \not= \phi(x) \vee (\phi(y) \wedge \phi(z)).\\)
But \\(\phi(L)\\) is a sublattice of \\(\mathbb Z^n\\), and so is distributive;
so this is a contradiction. 
{{% /div %}}

Therefore it suffices to study the distributive lattices in Chapter 3 as
sublattices of \\(\mathbb Z^n.\\) Doing so gives us a nice characterization
of their join-irreducible elements.

{{% div class="proposition" %}}
 Let \\(L\\) be a finite distributive lattice, and let
\\(\phi : L \to \mathbb Z^n\\) be an embedding. Write \\(\phi\\) as a vector
\\([\phi\_1, \phi\_2, \dots, \phi\_n],\\) where \\(\phi\_k : L \to \mathbb Z.\\) Say
\\(x \in L\\) is *\\(k\\)-decrementable* if there is another element \\(y \in L\\)
such that \\(\phi\_i(x) = \phi\_i(y)\\) if \\(i \not = k\\) and
\\(\phi\_k(x) = \phi\_k(y) + 1.\\) Then \\(x \in L\\) is join-irreducible if and
only if it is \\(k\\)-decrementable for exactly one \\(k.\\) 
{{% /div %}}
{{% div class="proof" %}}
 \\(x \in L\\) is \\(k\\)-decrementable for exactly one \\(k\\) if
and only if it covers exactly one element. 
{{% /div %}}

{{% div class="corollary" %}}
 With the above setup, let
\\(\phi\_k(L) = \\{m\_k, m\_k + 1, ..., M\_k\\}\\) be the image of \\(\phi\_k\\) in
\\(\mathbb Z.\\) For each \\(l \in \phi\_k(L)\\), let \\(L\_{k, l}\\) be the
sublattice of \\(l\\) formed by those elements that have \\(k\\)th coordinate
\\(l.\\) Let \\(\bot\_{k, l} = \min L\_{k, l}.\\) Then
\\[j(L) = \bigcup\_{k=1}^n \bigcup\_{l = m\_k + 1}^{M\_k} \\{\bot\_{k, l}\\}.\\]
{{% /div %}}

{{% div class="proof" %}}
 First, we claim that any element
\\(\bot\_{k, l}\\) covers at most one element. Suppose contrariwise that
\\(\bot\_{k, l}\\) covers two elements; then it is decrementable in two
positions \\(k\\), \\(k'.\\) But since \\(L\\) is distributive, decrementing \\(k'\\)
gives an element \\(\bot'\_{k, l} \leq \bot\_{k, l}\\), and by construction
\\(\bot'\_{k, l} \in L\_{k, l},\\) which contradicts the minimality of
\\(\bot\_{k, l}.\\)

Obviously \\(x\_{k, m\_k} = \bot,\\) which is not join-irreducible. Thus the
right-hand set is included in the left-hand set.

By the proposition, any join-irreducible element \\(y \in L\\) is
\\(k\\)-decrementable for exactly one \\(k.\\) We then have
\\(y = \bot\_{k, \phi\_k(y)},\\) and \\(\phi\_k(y) > m\_k.\\) Thus the left-hand set
is included in the right-hand set. 
{{% /div %}}

{{% div class="definition" %}}
 Let \\(C\\) be a chain-factorizable lattice; i.e., let
\\(C = \prod\_{i=1}^n C\_n\\) where the \\(C\_i\\) are chains. Let
\\(\phi = [\phi\_1, \phi\_2, \dots, \phi\_n]\\) be an embedding of \\(C\\) into
\\(\mathbb Z^n,\\) and let \\(\phi\_k(C) = \\{m\_k, m\_k + 1, \dots M\_k\\}\\) be the
image of \\(\phi\_k\\) in \\(\mathbb Z.\\) Then

1.  the *\\(k\\)-slice through \\(j\\)* is the set
    \\(C\_{k,j} \coloneqq \\{c \in C: \phi\_k(c) = j\\}\\), and
2.  if \\(j \in \\{m\_k, M\_k\\}\\) (that is, \\(j\\) is extremal,) \\(C\_{k,j}\\) is
    called a *face* of \\(C.\\)

{{% /div %}}

Faces of chain-factorizable lattices (specifically, chain-factorizable
*monochromatic components*) play an important role in [Chapter 3](/blog/thesis/supporting-graphs/).
