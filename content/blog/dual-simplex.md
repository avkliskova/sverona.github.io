---
title: The dual simplex method, an introduction
description: A term paper for an operations research class.
date: 2019-04-01
completion_status: complete
epistemic_status: confident
tags: [mathematics, grad-school, term-paper, 2019, operations-research, linear-operators]
---

The primal _simplex method_ provides an algorithmic means for solving
linear programs (hereinafter _LPs_.) This document motivates, defines,
and applies the so-called _dual simplex method_, a slight variant which
is useful for performing _post hoc_ sensitivity analysis on LPs solved
by the simplex method.


## The primal simplex method {#the-primal-simplex-method}

In this section, we review the three steps of the usual primal method,
following [Hillier-Lieberman],{{% sidenote %}}Frederick S. Hillier and Gerald J. Lieberman, *Introduction to operations research*, 10th ed., 2014.{{% /sidenote %}} section 5.2.{{% sidenote %}}This assumes the LP has been augmented by adding slack variables and/or artificial variables as necessary so that its constraints are in the form \\(\mathbf{Ax} + \mathbf{Ix\_s} = \mathbf{b}\\).){{% /sidenote %}}

1.  _Initialization_: Obtain an initial feasible solution \\(\mathbf{x}\\).
2.  _Test for optimality_: Check whether there are negative objective
    coefficients. If there are none, stop; an optimal solution has been
    attained. Otherwise, proceed with step 3.
3.  _Iteration_:
    1.  _Determine the entering basic variable._ This is done by
        identifying the column in which the most negative objective
        coefficient occurs.
    2.  _Determine the leaving basic variable._ This is done by performing
        a _minimum ratio test_: among the rows with positive entries in
        the entering basic variable's column, choose the one whose ratio
        of right-hand side to that column's entry is the smallest. The
        basic variable in that row is thereby chosen to leave the basis.
    3.  _Perform a change of basis._ This is done by performing row
        operations to transform the coefficients in the entering basic
        variable's column to match the current coefficients in the leaving
        basic variable's column.

4.  Go to step 2.


## Example {#example}

Consider the LP

\\[\begin{aligned} \textrm{maximize} \qquad & z(\mathbf{x}) = 40x\_1 +
70x\_2 \newline \textrm{subject to} \qquad & x\_1 + x\_2 \leq 100 \newline & 10x\_1 +
50x\_2 \leq 4000 \newline \textrm{and} \qquad & x\_{1,2} \geq 0. \end{aligned}\\]

This LP models the following toy problem:

> A forestry company has \\(100\\) acres of timber available for harvest.
> There are two options for treating the land after felling the timber
> (at a cost of \\(10000\\) USD per acre); either do nothing (which will
> return \\(50000\\) USD per acre,) or replant the land (which will ---
> eventually --- return \\(120000\\) USD per acre, but costs an additional
> \\(40000\\) USD per acre.) The company has \\(4000000\\) USD available and
> wishes to maximize total profit. How many acres of land should be
> replanted, and how many should be left alone?

The decision variables \\(x\_1\\) and \\(x\_2\\) represent the quantity of
land to be left alone (replanted.) The first constraint \\(x\_1 + x\_2 \leq
100\\) represents the constraint on available land; the second constraint
\\(10x\_1 + 50x\_2 \leq 4000\\) represents the constraint on available
capital (measured in units of \\(1000\\) USD.)

Solving this program by the simplex method proceeds as follows. We first
augment the problem with slack variables \\(x\_3 = 100 - (x\_1 + x\_2)\\),
\\(x\_4 = 4000 - (10x\_1 + 50x\_2)\\), giving the form

\\[\begin{aligned} \textrm{maximize} \qquad & z(\mathbf{x}) = 40x\_1 +
70x\_2 \newline \textrm{subject to} \qquad & x\_1 + x\_2 + x\_3 = 100 \newline & 10x\_1 +
50x\_2 + x\_4 = 4000 \newline \textrm{and} \qquad & x\_{1,2,3,4} \geq 0.
\end{aligned}\\]

The initial simplex tableau is

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & -40 & -70 & 0 & 0 & 0 \newline x\_3 & 1 & 0
& 1 & 1 & 1 & 0 & 100 \newline x\_4 & 2 & 0 & 10 & 50 & 0 & 1 & 4000 \newline \hline
\end{array}\\]


### Iteration 1 {#iteration-1}

First, we note that the present solution is not optimal (since \\(x\_1\\)
and \\(x\_2\\) have negative coefficients in row 0.)

The more negative coefficient is associated with \\(x\_2\\), so we choose
it to enter the basis.

Performing a minimum ratio test, we have (for \\(x\_3\\)) \\(100 / 1 = 100\\)
and (for \\(x\_4\\)) \\(4000 / 50 = 80\\). Since \\(x\_4\\) has the lower ratio,
we choose it to enter the basis.

So we pivot on the \\(50\\) in \\(x\_2\\)'s column and \\(x\_4\\)'s row:

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & -40 & -70 & 0 & 0 & 0 \newline x\_3 & 1 & 0
& 1 & 1 & 1 & 0 & 100 \newline x\_4 & 2 & 0 & 10 & \boxed{50} & 0 & 1 & 4000\newline
\hline \end{array}\\]

That is to say, we perform row operations to force the coefficients in
\\(x\_2\\)'s column to match the current coefficients in \\(x\_4\\)'s
column: - divide the \\(x\_4\\) row by \\(50\\), - subtract \\(1\\) times the
resulting row from the \\(x\_3\\) row, - and subtract \\(-70\\) times the
resulting row from the \\(z\\) row.

Doing this gives the new tableau

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & -26 & 0 & 0 & 7/5 & 5600 \newline x\_3 & 1 &
0 & 4/5 & 0 & 1 & -1/50 & 20 \newline x\_2 & 2 & 0 & 1/5 & 1 & 0 & 1/50 & 80\newline
\hline \end{array}\\]

Note that we've updated the basic-variable list in the leftmost column
accordingly.


### Iteration 2 {#iteration-2}

The present solution is still not optimal, since there is a \\(-26\\) in
the objective row.

It's in \\(x\_1\\)'s column, so \\(x\_1\\) will enter the basis.

Since \\(20 / (4/5) = 25 < 400 = 80 / (1/5)\\), \\(x\_3\\) will leave the
basis.

So we'll pivot on the \\(4/5\\) in \\(x\_1\\)'s column and \\(x\_3\\)'s row.
This gives the tableau

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & 0 & 0 & 75/2 & 3/4 & 6250 \newline x\_1 & 1
& 0 & 1 & 0 & 5/4 & -1/40 & 25 \newline x\_2 & 2 & 0 & 0 & 1 & -1/4 & 1/40 &
75\newline \hline \end{array}\\]

This solution is optimal.


## Duality theory {#duality-theory}

Recall that to any (primal) LP \\[\begin{aligned} \textrm{maximize}
\qquad& z(\mathbf{x}) = \mathbf{c} \mathbf{x} \newline \textrm{subject to}
\qquad& \mathbf{Ax} \leq \mathbf{b}\newline \textrm{and} \qquad& \mathbf{x}
\geq \mathbf{0} \end{aligned} \\] we may associate a _dual_ LP

\\[\begin{aligned} \textrm{minimize} \qquad& w(\mathbf{y}) = \mathbf{y}
\mathbf{b} \newline \textrm{subject to} \qquad& \mathbf{yA} \geq \mathbf{c}\newline
\textrm{and} \qquad& \mathbf{y} \geq \mathbf{0} \end{aligned}\\]
(where \\(\mathbf{y}\\) is a row vector,)
or, equivalently, \\[\begin{aligned}
\textrm{minimize} \qquad& w(\mathbf{y}) = \mathbf{b}^\top\mathbf{y} \newline
\textrm{subject to} \qquad& \mathbf{A}^\top\mathbf{y} \geq
\mathbf{c}^\top\newline \textrm{and} \qquad& \mathbf{y} \geq \mathbf{0}
\end{aligned}\\] (where \\(\mathbf{y}\\) is a column vector.)


## Example {#example-1}

The foregoing (primal) LP has dual

\\[\begin{aligned} \textrm{minimize} \qquad & w(\mathbf{y}) = 100y\_1 +
4000y\_2 \newline \textrm{subject to} \qquad & y\_1 + 10y\_2 \geq 40 \newline & y\_1 +
50y\_2 \geq 70 \newline \textrm{and} \qquad & y\_{1,2} \geq 0. \end{aligned}\\]

This LP may be thought of as modeling the problem of finding an _upper
bound_ for the primal LP as a linear combination of constraints, where
the variables \\(y\_i\\) represent the multiplier of the \\(i\\)th
constraint.


## Motivating the dual simplex method {#motivating-the-dual-simplex-method}

An important property of the primal simplex method is that the solution
attained at each iteration is (primal) feasible.{{% sidenote %}}This is assured
inductively by the minimum ratio test.{{% /sidenote %}} Similarly, the dual simplex
method attains a _dual_-feasible solution at each iteration.

Therefore, if perturbing a primal problem causes the new final solution
to be dual-feasible but not primal-feasible, the dual simplex method may
be used to attain the new optimal solution.

An important point to note is that the dual simplex method is, in a
sense, the dual _algorithm_ of the ordinary simplex method. It is not
the same as just applying the ordinary simplex method to the dual,
although it performs almost all the same calculations. In particular, it
operates on the primal tableau rather than the dual tableau.


## Applying the dual simplex method {#applying-the-dual-simplex-method}

1.  _Initialization_: Obtain an initial dual-feasible solution
    \\(\mathbf{y}\\). In practice, this will be given by a final primal
    tableau.
2.  _Test for feasibility_: Check whether there are negative right-hand
    sides. If there are none, stop; an primal-feasible (and hence
    primal-optimal) solution has been attained. Otherwise, proceed with
    step 3.
3.  _Iteration_:
    1.  _Determine the leaving basic variable._ This has already been done
        by identifying the row in which the negative right-hand side
        occurs.
    2.  _Determine the entering basic variable._ Among those columns in
        the pivot row whose coefficient is negative, choose the one whose
        ratio of that coefficient to its corresponding objective
        coefficient is minimized (in absolute value.)
    3.  _Perform a change of basis._ This is done as before.

4.  Go to step 2.

Note that the variables to be exchanged in the basis are determined in
the opposite order of the primal simplex method. This reflects the fact
that (after augmenting both problems) any variable that is basic in the
primal corresponds to a nonbasic variable in the dual, and vice versa.


## Example {#example-2}

Suppose the forestry company decides to sell 25 acres of its land at the
price of \\(6000\\) USD an acre. Then the right-hand sides in the primal
LP (ref) are changed, giving the problem

\\[\begin{aligned} \textrm{maximize} \qquad & z(\mathbf{x}) = 40x\_1 +
70x\_2 \newline \textrm{subject to} \qquad & x\_1 + x\_2 \leq 75 \newline & 10x\_1 +
50x\_2 \leq 4150 \newline \textrm{and} \qquad & x\_{1,2} \geq 0. \end{aligned}\\]

That is, there are \\(25\\) fewer acres of land and \\(150000\\) USD more
than in the original setup.

The optimal solution we found in the original problem \\((25, 75)\\) is
not primal-feasible in this new problem, but it is dual-feasible, as may
be checked.

We would like to find the new optimal solution for this perturbed
problem without effectively retracing the steps we took to solve the
original problem.

So we start with the final tableau from the original problem, which was

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & 0 & 0 & 75/2 & 3/4 & 6250 \newline x\_1 & 1
& 0 & 1 & 0 & 5/4 & -1/40 & 25 \newline x\_2 & 2 & 0 & 0 & 1 & -1/4 & 1/40 &
75\newline \hline \end{array}\\]

This was arrived at after a series of row operations, the net effect of
which was to transform the coefficients of the slack variables \\(x\_3\\)
and \\(x\_4\\) from the identity matrix to

\\[\mathbf{B}^{-1} = \begin{bmatrix} 5/4 & -1/40 \newline -1/4 & 1/40
\end{bmatrix}.\\]

As can be verified, the entire rows 1 and 2 of the final tableau can be
obtained by simply premultiplying the initial rows 1 and 2 by this
matrix.

Suppose we started instead with the appropriate initial tableau for the
new problem, with modified right sides, and performed all the same row
operations. Then --- multiplying through by \\(\mathbf{B}^{-1}\\) --- we
find that the variable coefficients will be the same, and the new
right-hand sides will be given by

\\[\begin{bmatrix} 5/4 & -1/40 \newline -1/4 & 1/40
\end{bmatrix}\begin{bmatrix} 75 \newline 4150 \end{bmatrix} = \begin{bmatrix}
-10 \newline 85\end{bmatrix} .\\]

So the _initial_ tableau for the dual simplex method will be

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & 0 & 0 & 75/2 & 3/4 & 5550 \newline x\_1 & 1
& 0 & 1 & 0 & 5/4 & -1/40 & -10 \newline x\_2 & 2 & 0 & 0 & 1 & -1/4 & 1/40 &
85 \newline \hline \end{array}\\]


### Iteration 1 {#iteration-1-1}

We observe that the solution is not primal-feasible, since there is a
\\(-10\\) in the right-hand side. Since this is in \\(x\_1\\)'s row, \\(x\_1\\)
will leave the basis.

To select the entering basic variable, we examine the variables in
\\(x\_1\\)'s row with negative coefficients. There is only one, the
\\(-1/40\\) in \\(x\_4\\)'s column, so \\(x\_4\\) will enter the basis.{{% sidenote %}}Were
there more than one, we would compare \\(\vert(3/4)/(-1/40)\vert\\) to the
corresponding ratios in the other columns, and choose the variable with
the lowest ratio.{{% /sidenote %}}

Thus we pivot on that \\(-1/40\\): \\[\begin{array}{|c|c|rrrrr|r|} \hline
\textbf{BV} & \textbf{Eq'n} & \mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} &
\mathbf{x\_3} & \mathbf{x\_4} & \textbf{RHS} \newline \hline z & 0 & 1 & 0 & 0 &
75/2 & 3/4 & 5550 \newline x\_1 & 1 & 0 & 1 & 0 & 5/4 & \boxed{-1/40} & -10\newline
x\_2 & 2 & 0 & 0 & 1 & -1/4 & 1/40 & 85 \newline \hline \end{array}\\]

This gives

\\[\begin{array}{|c|c|rrrrr|r|} \hline \textbf{BV} & \textbf{Eq'n} &
\mathbf{z} & \mathbf{x\_1} & \mathbf{x\_2} & \mathbf{x\_3} & \mathbf{x\_4} &
\textbf{RHS} \newline \hline z & 0 & 1 & 30 & 0 & 0 & 0 & 5250 \newline x\_4 & 1 & 0
& -40 & 0 & -50 & 1 & 400 \newline x\_2 & 2 & 0 & 1 & 1 & 1 & 0 & 75 \newline \hline
\end{array}\\]

Since there are no longer negative right-hand sides, the present
solution \\((0, 75)\\) is primal-feasible and hence optimal.


## Primal-dual method {#primal-dual-method}

The scenarios in which we can immediately apply the dual simplex method
are limited to those in which the starting point is dual-feasible and
primal-infeasible.

Were the starting point instead primal-feasible and dual-infeasible, we
could simply apply the primal simplex method.

The remaining case -- points that are infeasible both in the primal and
the dual -- is a little more involved. We follow [Vanderbei],{{% sidenote %}}Robert J. Vanderbei, *Linear programming: foundations and extensions,* 3rd ed., 2008{{% /sidenote %}} §6.5.

We know a solution is primal-feasible (dual-feasible) only if it has no
negative right-hand sides (no negative objective coefficients); so there
must be at least one negative entry in each.

The idea is to solve an _intermediate problem_ given by replacing some
of the offending coefficients with zeros. (This can be done in either
the objective row or the right-hand side column, but not both.) This can
be done by the primal or dual simplex method, depending on whether the
initial intermediate tableau is primal- or dual-feasible.

Once this has been done, the previously zeroed-out negative coefficients
can be restored, which gives an initial feasible solution for the real
problem. This can be solved using the variant of the simplex method that
was not used to solve the intermediate problem.

If the intermediate was solved with the dual simplex method, then it
must have had its negative objective coefficients zeroed out, and
restoring these will give a primal-feasible initial solution, suitable
for initializing the primal simplex method. Similarly, if the
intermediate was solved with the primal simplex method, the real problem
will require the dual simplex method.
