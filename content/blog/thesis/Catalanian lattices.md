---
title: Catalanian lattices
description: Main results of my thesis.
sequence: thesis
date: 2020-11-01
completion_status: complete
epistemic_status: confident
---

This section introduces and proves the author\'s main results.

## Gelfand-Tsetlin patterns

{{% div class="definition" %}}
 A *Gelfand-Tsetlin pattern* or just *GT pattern*
of order \\(n\\) is an \\(n \times n\\) lower triangular matrix with integer
entries that satisfies \\(g\_{i + 1, j} \leq g\_{ij} \leq g\_{i +1, j + 1}\\)
for any \\(1 \leq j \leq i \leq n.\\)[^1] 
{{% /div %}}


Visually, this says that entries in a GT pattern weakly decrease when
moving northwest or down.

{{% div class="definition" %}}
 A GT pattern of order \\(n\\) is *symplectic* if
\\(g\_{nj}\\) is even for any \\(j\\). 
{{% /div %}}


{{% div class="definition" %}}
 The *Catalanian lattice of order \\(n, k\\)*
\\(L\_C^{Cat}(n, k) = \mathscr C(n, k)\\) is defined as follows.

1.  Vertices of \\(\mathscr C(n, k)\\) are symplectic GT patterns of order
    \\(n\\) and maximum entry \\(2k.\\)
2.  \\(\mathscr C(n, k)\\) is ordered componentwise.
3.  If \\(x, y \in \mathscr C(n, k)\\), \\(x \to y\\) if and only if \\(x\\) and \\(y\\)
    differ in exactly one entry \\((i, j) \in [n]^2\\), with
    \\(x\_{ij} + 1 = y\_{ij}\\) if \\(i < n\\) or \\(x\_{ij} + 2 = y\_{ij}\\) if
    \\(i = n.\\)
4.  Edges of \\(\mathscr C(n, k)\\) are colored by \\([n]\\) according to the
    value of \\(i\\).
5.  Upon concatenating rows (and dividing the final row by 2),
    \\(\mathscr C(n, k)\\) embeds directly into \\(\mathbb Z^{\binom n 2}.\\)
    
{{% /div %}}


{{% div class="figure" %}}
[H]
\centering
\subfloat[\(\mathscr C(3,1)\)]{%
\includegraphics{diagrams/catalan31.pdf}
}\hspace{0.1\textwidth}%
\subfloat[\(j(\mathscr C(3,1))\)]{%
\includegraphics{diagrams/dissected-angelfish.pdf}
}
\caption{The Catalanian lattice \(\mathscr C(3, 1)\) and its poset of join-irreducibles.}

{{% /div %}}

## The cardinality of \\(\mathscr C(n, k)\\)

{{% div class="definition" %}}
 The *Catalan sequence*[^2] \\(\{c\_n\}\_{n=0}^\infty\\)
is given by \\(\displaystyle c\_n = \frac1{n+1}\binom{2n}n.\\) 
{{% /div %}}


We shall have cause to represent the Catalan numbers in a slightly
different form:

{{% div class="proposition" %}}
\\(c\_n = 4^n \displaystyle \prod\_{k=1}^n \frac{k-1/2}{k+1}.\\) 
{{% /div %}}

{{% div class="proof" %}}
 Hereinafter, define the *double factorial*
\\[\displaystyle n!! \coloneqq \prod\_{k=0}^{\lfloor (n-1)/2 \rfloor} (n - 2k) = n\cdot (n-2) \cdot ... \cdot 1.\\]
We have \begin{align}
c\_n = \frac1{n+1}\binom{2n}n &= \frac{(2n)!}{n!(n+1)!} \\\\
&= \frac{(2n)!!(2n - 1)!!}{n!(n+1)!} \\\\
&= 2^n \frac{(2n - 1)!!}{(n+1)!} \\\\
&= 4^n \prod\_{k=1}^n \frac{k - 1/2}{k + 1}.
\end{align}
{{% /div %}}


In [@donnelly-extremal], it was shown that \\(|\mathscr C(n, 1)| = c\_n.\\)
This section generalizes that result.

{{% div class="theorem" %}}
[Malone]
The vertex cardinality of the Catalanian lattice of order \\(n, k\\) is given by the \\(k \times k\\) Hankel determinant
\\[
\vert \mathscr C(n, k)\vert = \det M = \begin{vmatrix}
c\_n & c\_{n+1} & \cdots & c\_{n+k-1} \\\\
c\_{n+1} & c\_{n+2} & \cdots & c\_{n+k} \\\\
\vdots & \vdots & \ddots & \vdots \\\\
c\_{n+k-1} & c\_{n+k} & \cdots & c\_{n+2k-2}
\end{vmatrix}.
\\]
If we index this matrix by \\(i, j = 0, 1, \dots, k - 1\\), then \\(m\_{ij}\\), i.e., the \\(ij\\)th entry of \\(M\\), is \\(c\_{n + i + j}.\\)

{{% /div %}}

Before we prove this theorem, we reproduce, more legibly, a result from
[@gessel].

{{% div class="lemma" %}}

\\(\displaystyle \det M = \prod\_{j=0}^{k-1} \frac{(2n + 2j)!(2j + 1)!}{(n + j + 1)!(k - 1 + n + j)!}.\\)

{{% /div %}}

{{% div class="proof" %}}
 First, note that \begin{align}
m\_{ij} = c\_{n + i + j} &= 4^{n + i + j} \prod\_{l = 1}^{n + i + j} \frac{l-1/2}{l+1} \\\\
&= 4^i 4^{n+j} \left(\prod\_{l=1}^{n+j} \frac{l-1/2}{l+1}\right) \cdot \left(\prod\_{l=n+j+1}^{n+j+i} \frac{l - 1/2}{l+1}\right) \\\\
&= 4^i 4^{n+j} \left(\prod\_{l=1}^{n+j} \frac{l-1/2}{l+1}\right) \cdot \left(\prod\_{l=1}^{i} \frac{n + j + l - 1/2}{n + j + l +1}\right) \\\\
&= 4^i c\_{n+j} \prod\_{l=1}^i \frac{n+j+l-1/2}{n+j+l+1}.
\end{align}

Now consider the \\(n \times n\\) matrix \\(N\\) whose \\(ij\\)th
entry is \begin{align}
n\_{ij} = \frac{c\_{n+i+j}}{4^ic\_{n+j}} &= \prod\_{l=1}^i \frac{n+j+l-1/2}{n+j+l+1} \\\\
&= \frac{\Gamma(n+j+i-1/2)\Gamma(n + j + 1)}{\Gamma(n + j - 1/2)\Gamma(n + j + i + 1)}
\end{align} Applying Gauss\' hypergeometric identity with
\\(\gamma = n + j + 1\\), \\(\alpha = -i\\), \\(\beta = 3/2\\), we have
\\[n\_{ij} = \sum\_{r=0}^{\infty}\prod\_{l=0}^{r-1} \frac{(l - i)(l+3/2)}{(l+n+j+1)(l+1)}.\\]

Now if \\(r - 1 - i \geq 0\\), the product becomes zero. The maximum value
of \\(i\\) is \\(k - 1\\), so the series terminates at or before the point when
\\(r - 1 = k - 1\\). Thus it suffices to cut the series off at \\(r = k - 1\\),
and we have \begin{align}
n\_{ij} &= \sum\_{r=0}^{k-1} \prod\_{l=0}^{r-1} \frac{(l-i)(l+3/2)}{(l + n + j + 1)(l+1)} \\\\
&= \sum\_{r=0}^{k-1} \left(\prod\_{l=0}^{r-1} \frac1{l+n+j+1}\right) \left(\prod\_{l=0}^{r-1} \frac{(l-i)(l + 3/2)}{l + 1} \right).
\end{align} Therefore, \\(N\\) can be written as a matrix product \\(AB\\),
with \\(n\_{ij} = \sum\_r a\_{ir} b\_{rj}\\), where \begin{align}
a\_{ij} &= \prod\_{l=0}^{j-1} \frac{(l-i)(l+3/2)}{l+1}, \\\\
b\_{ij} &= \prod\_{l=0}^{j-1} \frac1{l+n+j+1}.
\end{align} In particular, we have \\(\det N = \det A \det B.\\) We
tackle these determinants separately.

To compute \\(\det A\\), note that \\(a\_{ij} = 0\\) if \\(j > i\\); that is, \\(A\\) is
lower triangular. Thus \begin{align}
\det A = \prod\_{i=0}^{k-1} a\_{ii} &= \prod\_{i=0}^{k-1} \prod\_{l=0}^{i-1} \frac{(l - i)(l+ 3/2)}{l + 1} \\\\
&= \prod\_{i=0}^{k-1} \left(\frac{(-1)^i i!}{i!} \prod\_{l=0}^{i-1} l + 3/2\right) \\\\
&= \prod\_{i=0}^{k-1} (-1)^i \left(\prod\_{l=0}^{i-1} l + 3/2\right) \\\\
&= \prod\_{i=0}^{k-1} (-1)^i 2^{-i} \prod\_{i=0}^{k-1} 2l + 3 \\\\
&= \prod\_{i=0}^{k-1} (-1)^i 2^{-i} \frac{(2i + 1)!}{i! \cdot 2^i} \\\\
&= \prod\_{i=0}^{k-1} (-1)^i 4^{-i} \frac{(2i + 1)!}{i!}.
\end{align} To compute \\(\det B\\), note that the maximum value taken
on by \\(l\\) is \\(k - 2\\), and write
\\[b\_{ij} = \frac{\prod\_{l=j}^{k-2} l + n + i + 1}{\prod\_{l=0}^{k-2} l + n + i + 1}.\\]
If we factor out the denominator from each row \\(j\\), then the matrix \\(B\\)
looks like this:

\begin{align}
B = \left(\prod\_{j=0}^{k-1} \frac1{\prod\_{l=0}^{k-2} l + n + j + 1}\right)
\begin{bmatrix}
\prod\_{l=0}^{k-2} (l + n + 1) & \cdots & \prod\_{l=0}^{k-2} (l + n + k - 2 + 1) \\\\
\prod\_{l=1}^{k-2} (l + n + 1) & \cdots & \prod\_{l=1}^{k-2} (l + n + k - 2 + 1) \\\\
\vdots & \ddots & \vdots \\\\
\prod\_{l=k-2}^{k-2} (l + n + 1) & \cdots & \prod\_{l=k-2}^{k-2} (l + n + k - 2 + 1) \\\\
\prod\_{l=k-1}^{k-2} (l + n + 1) & \cdots & \prod\_{l=k-1}^{k-2} (l + n + k - 2 + 1)
\end{bmatrix}.
\end{align}

Note that the bottom row is composed of empty products, i.e., 1s, and
going up one row adds one additional term to the product. In addition,
this product is unchanged across columns, except for the value of \\(i\\).
Therefore, subtracting an appropriate multiple of the bottom row from
the penultimate row, we obtain \\((k + n -1), (k+n), \dots, (2k + n - 3).\\)
Doing similarly with the antepenultimate row and the bottom two rows, we
obtain \\((k + n - 1)^2, \dots, (2k + n - 3)^2.\\) This process can be
repeated for every row without ever changing the determinant. So we
conclude that \\(B\\) has the same determinant as \begin{align}
B' = \left( \prod\_{j=0}^{k-1} \frac1{\prod\_{l = 0}^{k - 2} l + n + j + 1}\right)
\begin{bmatrix}
(k + n - 1)^{k - 1} & \cdots & (2k + n - 3)^{k - 1} \\\\
(k + n - 1)^{k - 2} & \cdots & (2k + n - 3)^{k - 2} \\\\
\vdots & \ddots & \vdots \\\\
(k + n - 1) & \cdots & (2k + n - 3) \\\\
1 & \cdots & 1
\end{bmatrix}.
\end{align} The Vandermonde matrix on the right, whose \\(ij\\)th entry
is \\((k + n - 1 + j)^{k - 1 - i}\\), has determinant 
\begin{align}
& \prod\_{i=0}^{k-1} \prod\_{j=i+1}^{k-1} [(k + n - 1 + i) - (k + n - 1 + j)] \\\\
=& \prod\_{i=0}^{k-1} \prod\_{j=i+1}^{k-1} (i-j) \\\\
=& \prod\_{i=0}^{k-1} \prod\_{j=1}^{k-1-i} (-j) \\\\
=& \prod\_{i=0}^{k-1} (-1)^{k - 1 - i} (k - 1 - i)! \\\\
=& \prod\_{i=0}^{k-1} (-1)^i i!.
\end{align} So we conclude that \begin{align}
\det B &= \left(\prod\_{j=0}^{k-1} \frac1{\prod\_{l=0}^{k-2} l + n + j + 1}\right) \cdot \prod\_{i=0}^{k-1} (-1)^i i! \\\\
&= \left(\prod\_{j=0}^{k-1} \frac{(n + j)!}{(k - 1 + n + j)!} \right) \cdot \prod\_{i=0}^{k-1} (-1)^i i!,
\end{align} and thus that \begin{align}
\det N  &= \det A \det B \\\\
&= \left( \prod\_{i=0}^{k-1} (-1)^i 4^{-i}\frac{(2i + 1)!}{i!} \right) \cdot \left( \prod\_{j=0}^{k-1} \frac{(n + j)!}{(k - 1 + n + j)!}\right) \cdot \prod\_{i=0}^{k-1} (-1)^i i! \\\\
&= \left( \prod\_{i=0}^{k-1} (-1)^i 4^{-i}(2i + 1)! \right) \cdot \left( \prod\_{j=0}^{k-1} \frac{(n + j)!}{(k - 1 + n + j)!}\right).
\end{align} Now to obtain \\(M\\) from \\(N\\), we must multiply each row by
\\(4^i\\) and each column by
\\(\displaystyle c\_{n+j} = \frac{(2n + 2j)!}{(n+j+1)!(n+j)!}.\\) So we
finally obtain \begin{align}
\det M &= \left( \prod\_{i=0}^{k-1} 4^i \right) \cdot \left( \prod\_{j=0}^{k-1} \frac{(2n + 2j)! }{(n + j + 1)!(n + j)!}\right) \cdot \det N \\\\
&= \left( \prod\_{i=0}^{k-1}4^i  \right) \cdot \left( \prod\_{j=0}^{k-1} \frac{(2n + 2j)! }{(n + j + 1)!(n + j)!}\right) \cdot \left(\prod\_{i=0}^{k-1} 4^{-i}(2i+1)! \right)\\\\
&\qquad \cdot \left(\prod\_{j=0}^{k-1} \frac{(n + j)!}{(k - 1 + n + j)!} \right)\\\\
&= \left( \prod\_{j=0}^{k-1} \frac{(2n + 2j)! }{(n + j + 1)!(k-1 + n + j)!}\right) \cdot \left(\prod\_{i=0}^{k-1} (2i+1)! \right)  \\\\
&= \prod\_{j=0}^{k-1} \frac{(2j + 1)!(2n + 2j)!}{(n + j + 1)!(k-1 + n + j)!}.
\end{align}
{{% /div %}}
{{% div class="lemma" %}}

\\(\displaystyle|L\_C^{Cat}(n, k)| = \binom{n+k}{k} \prod\_{i=1}^n \frac{i!(2k + 2i - 1)!}{(2i - 1)!(2k + i)!}.\\)

{{% /div %}}
 {{% div class="proof" %}}
 [@donnelly-poset-models], §8.10, §B.23
gives \begin{align}
\vert L\_C^{Cat}(n, k)\vert &= \binom{n+k}{k} \prod\_{i=1}^n \prod\_{j=0}^{n - i - 1} \frac{2k + 2n + 1 - 2i - j}{2n + 1 - 2i - j} \\\\
&= \binom{n + k}{k} \prod\_{i=1}^n \frac{(n - i + 1)!(2k + 2n - 2i + 1)!}{(2n - 2i + 1)!(2k + n - i + 1)!}.
\end{align} Making the substitution \\(i' = n - i + 1,\\) we obtain
\\[|L\_C^{Cat}(n, k)| = \binom{n+k}{k} \prod\_{i=1}^n \frac{i!(2k + 2i - 1)!}{(2i - 1)!(2k + i)!}.\\]

{{% /div %}}
 Therefore, the proof of the foregoing theorem is a matter
of showing that this expression agrees with the one previously obtained
for \\(\det M\\).

{{% div class="lemma" %}}

\\(\displaystyle \prod\_{k=1}^N \frac{(2k - 1)!}{(N + k)!} = \prod\_{k=1}^N \frac{k!}{(2k)!}.\\)

{{% /div %}}
 {{% div class="proof" %}}
 Cross-multiply. Then both sides are equal
to \\(\prod\_{k=1}^{2N} k!.\\) 
{{% /div %}}


{{% div class="theorem" %}}
 For all positive integers \\(n, k\\), $$\begin{align}
\prod\_{i=1}^k \frac{(2n + 2i)!(2i - 1)!}{(n + i)!(n + i + k)!} = \binom{n+k}n \prod\_{i=1}^n \frac{i!(2k + 2i - 1)!}{(2i - 1)!(2k + i)!}.
\end{align}$$ 
{{% /div %}}
 {{% div class="proof" %}}
 We proceed by induction on
the difference \\(k - n\\) in either direction. There will be two separate
inductive cases, each depending on the basis (B) as follows:

\\[\begin{array}{r|lllll}
n\backslash k & 1 & 2 & 3 & 4 & 5 \\\\
\hline
1 & B & \leftarrow & \leftarrow & \leftarrow & \leftarrow\\\\
2 & \rightarrow & B & \leftarrow & \leftarrow & \leftarrow\\\\
3 & \rightarrow & \rightarrow & B & \leftarrow & \leftarrow\\\\
4 & \rightarrow & \rightarrow & \rightarrow & B & \leftarrow \\\\
5 & \rightarrow & \rightarrow & \rightarrow & \rightarrow & B \\\\
\end{array}\\]

*Basis:* \\(k - n = 0\\). So \\(k = n\\) and we must show
\\[\prod\_{i=1}^n \frac{(2n + 2i)!(2i - 1)!}{(n + i)!(2n + i)!} = \binom{2n}n \prod\_{i=1}^n \frac{i!(2n + 2i - 1)!}{(2i - 1)!(2n + i)!}.\\]
Applying Lemma 4.3 to the left-hand side, with \\(N = n\\), \\(k = i\\), we
obtain \begin{align}
\prod\_{i=1}^n \frac{(2n + 2i)!(2i - 1)!}{(n + i )!(2n + i)!} &= \prod\_{i=1}^n \frac{i!(2n + 2i)!}{(2i)!(2n + i)!} \\\\
&= \prod\_{i=1}^n \left( \frac{i!(2n + 2i - 1)!}{(2i - 1)!(2n+i)!} \cdot \frac{2n + 2i}{2i} \right) \\\\
&= \prod\_{i=1}^n \frac{i!(2n + 2i - 1)!}{(2i - 1)!(2n+i)!} \cdot \prod\_{i=1}^n \frac{n + i}{i} \\\\
&= \binom{2n}n \prod\_{i=1}^n \frac{i!(2n + 2i - 1)!}{(2i - 1)!(2n+i)!},
\end{align} which was to be shown.

*Inductive case 1:* \\(k - n > 0\\). Assume inductively that the theorem
holds for \\(k = n+ r\\), \\(r = 0, 1, \dots\\). Explicitly, assume
\\[\prod\_{i=1}^{n+r} \frac{(2n + 2i)!(2i - 1)!}{(n + i)!(2n + i + r)!} = \binom{2n + r}{n} \prod\_{i=1}^n \frac{i!(2n+ 2r+ 2i - 1)!}{(2i - 1)!(2n + 2r + i)!}.\\]
We must show that the theorem holds for \\(k = n + r + 1\\); explicitly,
that
\\[\prod\_{i=1}^{n+r + 1} \frac{(2n + 2i)!(2i - 1)!}{(n + i)!(2n + i + r + 1)!} = \binom{2n + r + 1}{n} \prod\_{i=1}^n \frac{i!(2n+ 2r+ 2i + 1)!}{(2i - 1)!(2n + 2r + i + 2)!}\\]
By the inductive hypothesis, it suffices to show that the quotient of
the \\(k = n + r + 1\\) case by the \\(k = n+r\\) case on both sides is equal.

On the left, we have \begin{align}
&\frac{(4n + 2r+ 2)!(2n+ 2r+ 1)!}{(2n + r+ 1)!} \cdot \frac{\prod\_{i=1}^{n + r + 1} (1/2n + i+ r + 1)!)}{\prod\_{i=1}^{n+r} (2n + i + r + 1)!} \\\\
=~&\frac{(4n + 2r + 2)!(2n+ 2r+ 1)!}{(2n + r+ 1)!(3n + 2r + 2)!} \cdot \frac{\prod\_{i=1}^{n + r} (2n + i +r)!}{\prod\_{i=1}^{n+r} (2n + i + r + 1)!} \\\\
=~&\frac{(4n + 2r + 2)!(2n + 2r + 1)!}{(2n + r + 1)!(3n + 2r + 2)!} \cdot \prod\_{i=1}^{n+r} \frac1{2n + i + r + 1} \\\\
=~&\frac{(4n + 2r + 2)!(2n + 2r + 1)!}{(2n + r + 1)!(3n + 2r + 2)!} \cdot \frac{(2n + r + 1)!}{(3n + 2r + 1)!} \\\\
=~&\frac{(4n + 2r + 2)!(2n + 2r + 1)!}{(3n + 2r + 1)!(3n + 2r + 2)!}.
\end{align}

On the right, we have \begin{align}
&\frac{\binom{2n + r + 1}{n}}{\binom{2n + r}{n}} \cdot \prod\_{i=1}^n \prod\_{i=1}^n \frac{(2n + 2r+ 2i + 1)!(2n + 2r + i)!}{(2n + 2r + 2i - 1)!(2n + 2r + i + 1)!} \\\\
=~& \frac{2n + r + 1}{n + r + 1} \cdot \prod\_{i=1}^n \frac{(2n + 2r+ 2i + 1)(2n + 2r + 2i)}{(2n + 2r+ i + 2)(2n + 2r + i + 1)}
\end{align} Turning the terms depending on \\(2i\\) into double
factorials and the other terms into single factorials, we have
\begin{align}
=~& \frac{2n + r + 1}{n + r + 1} \cdot \frac{(4n + 2r + 1)!! (4n + 2r)!!}{(2n + 2r + 1)!!(2n + 2r)!!} \cdot \frac{(2n + 2r + 2)!(2n + 2r + 1)!}{(3n + 2r + 2)!(3n + 2r + 1)!} \\\\
=~& \frac{2n + r + 1}{n + r + 1} \cdot \frac{(4n + 2r + 1)!}{(2n + 2r + 1)!} \cdot \frac{(2n + 2r + 2)!(2n + 2r + 1)!}{(3n + 2r + 2)!(3n + 2r + 1)!} \\\\
=~& \frac{2n + r + 1}{n + r + 1} \cdot \frac{(4n + 2r + 1)!(2n + 2r + 2)!}{(3n + 2r + 2)!(3n + 2r + 1)!} \\\\
=~& \frac{4n + 2r + 2}{2n + 2r + 2} \cdot \frac{(4n + 2r + 1)!(2n + 2r + 2)!}{(3n + 2r + 2)!(3n + 2r + 1)!} \\\\
=~& \frac{(4n + 2r + 2)!(2n + 2r + 1)!}{(3n + 2r + 2)!(3n + 2r + 1)!}.
\end{align} This completes the first inductive case.

*Inductive case 2:* \\(k - n < 0\\). This proceeds analogously to the
previous inductive case, except the induction runs backwards.

Assume inductively that the theorem holds for \\(k = n - r\\),
\\(r = 0, 1, \dots, n - 2\\). Explicitly, assume
\\[\prod\_{i=1}^{n-r} \frac{(2n + 2i)!(2i - 1)!}{(n + i)!(2n + i - r)!} = \binom{2n - r}{n} \prod\_{i = 1}^n \frac{i!(2n - 2r + 2i - 1)!}{(2i - 1)!(2n - 2r + i)!}\\]
We must show that the theorem holds for \\(k = n - r - 1\\); explicitly,
\\[\prod\_{i=1}^{n-r - 1} \frac{(2n + 2i)!(2i - 1)!}{(n + i)!(2n + i - r - 1)!} = \binom{2n - r - 1}{n} \prod\_{i = 1}^n \frac{i!(2n - 2r + 2i - 3)!}{(2i - 1)!(2n - 2r + i - 2)!}\\]
As before, we show that the quotient of the \\(n - r\\) case by the
\\(n - r - 1\\) case is the same on both sides.

On the left, we have: \begin{align}
&\frac{(4n - 2r)!(2n - 2r - 1)!}{(2n - r)!} \cdot \frac{\prod\_{i=1}^{n - r} (1/(2n + i - r)!)}{\prod\_{i=1}^{n - r - 1} (1 / (2n + i - r - 1)!)} \\\\
=~&\frac{(4n - 2r)!(2n - 2r - 1)!}{(2n - r)!} \cdot \frac{\prod\_{i=1}^{n - r - 1} (2n + i - r - 1)!}{\prod\_{i=1}^{n - r} (2n + i - r)!} \\\\
=~&\frac{(4n - 2r)!(2n - 2r - 1)!}{(2n - r)!(3n - 2r)!} \cdot \frac{\prod\_{i=1}^{n - r - 1} (2n + i - r - 1)!}{\prod\_{i=1}^{n - r - 1} (2n + i - r)!} \\\\
=~&\frac{(4n - 2r)!(2n - 2r - 1)!}{(2n - r)!(3n - 2r)!} \cdot \prod\_{i=1}^{n - r - 1} \frac{1}{2n + i - r} \\\\
=~&\frac{(4n - 2r)!(2n - 2r - 1)!}{(2n - r)!(3n - 2r)!} \cdot \frac{(2n - r)!}{(3n - 2r - 1)!} \\\\
=~&\frac{(4n - 2r)!(2n - 2r - 1)!}{(3n - 2r)!(3n - 2r - 1)!}.
\end{align}

And on the right, we have \begin{align}
& \frac{\binom{2n - r}n}{\binom{2n - r  - 1}{n}} \cdot \prod\_{i=1}^n \frac{(2n - 2r + 2i  - 1)!(2n - 2r + i - 2)!}{(2n - 2r + 2i - 3)!(2n - 2r + i)!} \\\\
=~& \frac{2n - r}{n - r}\cdot \prod\_{i=1}^n \frac{(2n - 2r + 2i - 1)(2n - 2r + 2i - 2)}{(2n - 2r + i)(2n - 2r + i - 1)} \\\\
=~& \frac{2n - r}{n - r} \cdot \frac{(4n - 2r - 1)!!(4n - 2r - 2)!!}{(2n - 2r - 1)!!(2n - 2r - 2)!!} \cdot \frac{(2n - 2r)!(2n - 2r - 1)!}{(3n - 2r)!(3n - 2r - 1)!} \\\\
=~& \frac{2n - r}{n - r} \cdot \frac{(4n - 2r - 1)!}{(2n - 2r - 1)!} \cdot \frac{(2n - 2r)!(2n - 2r - 1)!}{(3n - 2r)!(3n - 2r - 1)!} \\\\
=~& \frac{2n - r}{n - r} \cdot \frac{(4n - 2r - 1)!(2n - 2r)!}{(3n - 2r)!(3n - 2r - 1)!} \\\\
=~& \frac{4n - 2r}{2n - 2r} \cdot \frac{(4n - 2r - 1)!(2n - 2r)!}{(3n - 2r)!(3n - 2r - 1)!} \\\\
=~& \frac{(4n - 2r)!(2n - 2r - 1)!}{(3n - 2r)!(3n - 2r - 1)!}
\end{align}

This completes the proof. 
{{% /div %}}


## Product solitarity of \\(\mathscr C(n,k)\\)

In this section, we show the following result.

{{% div class="theorem" %}}
[Dunkum-Donnelly-Malone]
If there exists a set of positive, rational, and DCS-satisfactory coefficients for the lattice \\(\mathscr C(n, k)\\), then \\(\mathscr C(n, k)\\) is product solitary.

{{% /div %}}

Key to this result is a lemma appearing in [@gelfand-tsetlin].

{{% div class="lemma" %}}
[Gelfand-Tsetlin 1950]
A color-\\(k\\) component of \\(\mathscr C(n, k)\\), \\(k = 1, \dots, n - 1\\), realizes a representation of the Lie algebra \\(A\_k.\\) Furthermore, the edge coefficients are uniquely determined as positive rationals.

{{% /div %}}

{{% div class="proof" %}}
[Proof of Theorem 4.3.]
By Lemma 4.4, any component of color \\(1, \dots, n - 1\\) is product solitary.

We induct over color-\\(n\\) components. First we must assign an integer \\(s(C)\\) to each color-\\(n\\) component. Observe that all vertices of a given color-\\(n\\) component differ only in the \\(n\\)th row. Therefore, if \\(p < n\\), then \\(c\_{p,q}\\) is identical for every \\(c \in C.\\) The quantity we induct over will be the sum of these identical entries \\(s(C) \coloneqq \sum\_{p=1}^{n-1} \sum\_{q = 1}^p c\_{p,q}.\\)

*Basis, \\(s(C) = 0.\\)* In this case, the \\(n\\)th row must be all zeros, with the exception of the bottom right entry, which must be one of \\(0, 2, \dots, 2k.\\) So \\(C\\) is a chain of length \\(k\\), and its edge coefficients are uniquely determined positive rational numbers, as shown previously.

*Induction.* Assume inductively that for some nonnegative integer \\(S\\), if \\(C\\) is a color-\\(n\\) component and \\(s(C) \leq S\\), then \\(C\\) is product solitary.

Suppose we have a component \\(C\\) with \\(s(C) = S + 1.\\) Let \\(\bot = \min C.\\) Let \\(r \in [n]\\) be the index of the first column for which \\(\bot\_{n,r} \not= x\_{n,r}\\) for some \\(x \in C.\\) Then \\(F = C\_{(n,r),\bot\_{n,r}}\\) is a face of \\(C\\); we claim its edge products are uniquely determined positive rationals.

List the identical elements of \\(C\\) by columns, left-to-right and bottom-to-top; i.e., \\[c\_{n-1,1}, c\_{n-2,1}, \dots, c\_{1, 1};\quad c\_{n - 1, 2}, \dots, c\_{2, 2};\quad \dots \quad c\_{n-1,n-1}.\\]
Since \\(s(C) > 0\\), there is a nonzero entry in this list. Let \\(c\_{p, q}\\) be the *first* nonzero entry. For any \\(x \in F\\), \\(x\\) is \\((p,q)\\)-decrementable, since otherwise \\(c\_{p,q}\\) would equal one of \\(c\_{p+1, q}\\) or \\(c\_{p-1, q-1},\\) both of which precede it in the list. Therefore if \\(x \overset{n}\to y\\) for \\(x, y \in F\\), there must be edges \\(x' \overset{p} \to x\\), \\(y' \overset{p} \to y,\\) and \\(x' \overset{n} \to y'.\\) Now we have the following.
1. \\(\pi\_{x',y'}\\) is uniquely determined as a positive rational by the inductive assumption, since \\(x' \overset{n}\to y'\\) belongs to an \\(n\\)-component \\(C'\\) with \\(s(C') = S\\).
2. \\(\pi\_{x,x'}\\) and \\(\pi\_{y,y'}\\) are uniquely determined as positive rationals by Lemma 4.4.
3. \\(\pi\_{x,y}\\) is uniquely determined as a positive rational by the diamond relation at \\(x' \to x \to y\\), \\(x' \to y' \to y.\\)
Now, in view of Proposition 3.1, \\(C\\) is product solitary. This completes the induction.
{{% /div %}}

We close this chapter with the natural counterpart to a uniqueness
theorem.

{{% div class="conjecture" %}}
 There exists a set of positive rational
DCS-satisfactory coefficients for \\(\mathscr C(n, k).\\) 
{{% /div %}}


In theory, the inductive framework used in Theorem 4.3 should hold.
However, it is unknown whether nonpositive numbers arise while carrying
out the process described in the proof of Proposition 3.1. In other
words, the following question is open.

{{% div class="question" %}}
 Let \\(C\\) be a chain-factorizable monochromatic
lattice. Let \\(F\\) be a face of \\(C\\), and suppose a set \\(\Pi\_F\\) of positive
rational edge products for \\(F\\) is known *a priori.* Under what
conditions does \\(\Pi\_F\\) propagate to a set of positive rational edge
products for \\(C\\)? 
{{% /div %}}


[^1]: This definition is equivalent to that given in [@stanley-ec2]
    §7.10. We represent GT patterns as matrices here for ease of
    computation and typesetting.

[^2]: The Catalan sequence counts, among other things, the number of
    valid arrangements of \\(n\\) left and \\(n\\) right parentheses; that is,
    the number of permutations in which every left parenthesis has a
    matching right parenthesis.
