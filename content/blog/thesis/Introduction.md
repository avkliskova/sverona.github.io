---
title: Introduction
description: 
sequence: thesis
date: 2020-11-01
completion_status: complete
epistemic_status: confident
---

# Introduction

The abstract describes our overall motivation, direction, and goals.
Here we describe the organization of this thesis.

Chapter 2 provides the necessary background for the sequel, assuming an undergraduate-level knowledge of group theory, graph theory, and linear algebra. In particular, we introduce the basics of lattice theory, of representation theory, and of the theory of Lie algebras.

In Chapter 3, we present Donnelly\'s notion of a *supporting graph*, which makes explicit the aforementioned correspondence between posets and representations, following [@donnelly-extremal]. We furnish several examples of such poset-representation correspondences. In particular, we define the *generalized Fibonaccian lattices* \\(L_A^{Fib}(n+1, k) = \mathscr F(n + 1, k)\\) and illustrate some examples.  We also reproduce an explicit formula for \\(|\mathscr F(n + 1, k)|\\) from [@donnelly-fibonaccian] which specializes to the result that \\(|\mathscr F(3, k)|\\) is the Fibonacci number \\(F_{2n + 2}.\\)

In Chapter 4, we introduce the *generalized Catalanian lattices* \\(L_C^{Cat}(n, k) = \mathscr C(n, k)\\) and illustrate some examples. We also prove a nice, explicit, and apparently new formula for \\(\vert L_C^{Cat}(n, k)\vert = \mathscr C(n, k)\\). Finally, we demonstrate uniqueness of DCS-satisfactory edge coefficients for lattices in this family.

Chapter 5 introduces two well-known combinatorial constructs and
proposes a bijection between them. The *topside peakless Motzkin paths* (TPMPs) are lattice paths obeying some simple constraints; we show that the number of TPMPs of length \\(n\\) is given by the \\(n\\)th peakless Motzkin number. *Littlewood-Richardson tableaux* are generalizations of Young tableaux which appear prominently in enumerative combinatorics. We conjecture that Littlewood-Richardson tableaux of a certain shape \\(P_n/Q_n\\) are equinumerous with length-\\(n\\) TPMPs, and provide some empirical evidence to support this claim.

Chapter 6 gives an overview of the algorithms and Python code used to produce the illustrations and some of the foregoing results.
