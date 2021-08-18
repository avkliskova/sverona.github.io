---
title: Neural networks in time scale calculus
date: 2018-12-01
completion_status: complete
epistemic_stauts: confident
---

_Neural networks_ are a popular technique for machine learning problems such as automated handwriting recognition, automated speech recognition, and time-series forecasting. On these tasks, so-called _deep neural networks_ [Schmidhuber 2015] and _convolutional neural networks_ [Ciresan et al. 2011] have performed at least as well as the best known non-neural-network statistical learning techniques. A typical neural network numerically solves an extremization problem using gradient descent in a high-dimensional Euclidean space using an algorithm known as _backpropagation_.

We provide an exposition of (feedforward) neural networks and backpropagation on \\(\mathbb{R}^n\\), analogous to that found in [Nielsen 2015]. We further generalize these concepts from \\(\mathbb{R}^n\\) to a product of _time scales_, or closed subsets of \\(\mathbb{R}\\) which may be partially discrete and partially continuous.

Most of the main results were already derived in [Seiffert & Wunsch
2010] for delta derivatives; we present what are mostly the dual cases
for nabla derivatives.


## Introduction {#introduction}

Neural networks perform _supervised learning tasks_, meaning that they
"learn" to emulate a desired set of outputs from a given set of
already-classified _training examples_.

If we think of this "desired set of outputs" as a function
\\(f : \mathbb{R}^M \to \mathbb{R}^N\\), then a good neural network
approximates \\(f\\) accurately by a function \\(\hat{f} : \mathbb{R}^M \to
\mathbb{R}^N\\).

We measure the network's performance by a positive _loss function_ \\(L :
\mathbb{R}^N \to [0, \infty)\\), which we want the network to minimize.
Typically \\(L\\) is the sum of squared errors

\\[ \begin{aligned} L(\hat{f}(I)) = \frac{1}{2} \sum\_{k=1}^N (f(I)\_k -
\hat{f}(I)\_k)^2, \end{aligned} \\]

where \\(f(I)\\) is the "expected" response and \\(\hat{f}(I)\\) is the
network's actual response.


### Example: digit recognition {#example-digit-recognition}

One of the canonical problems for neural network learning is _digit
recognition_: given an image that represents a (handwritten) numeral
from 0 to 9, we wish to classify it appropriately. This section gives a
brief rigorous specification of the problem as it is usually stated.

The MNIST dataset, which consists of 60,000 greyscale images that are
each 28 pixels square, is traditionally used for training. Such an image
has a total of \\(28^2 = 784\\) pixels, each of which has an intensity
between 0 (black) and 1 (white.) Thus it can be represented as an
element of \\([0, 1]^{784}\\), and we expect the network to output its
relative confidence that the image represents a 0, 1, ..., 9 as a
probability.

{{% sidenote %}} That is, an element of \([0, 1]^{10}\) whose sum is 1.{{% /sidenote %}}

Thus the network's job is to approximate an unknown function \\(f :
\mathbb{R}^{784} \to \mathbb{R}^{10}\\) whose value at each image in the
training set is known.

For instance, we expect that an image \\(I \in \mathbb{R}^{784}\\) which
represents a numeral 0 should have \\(f(I) = [1, 0, 0, \dots, 0]^T\\). If
the network instead responded with \\(\hat{f}(I) = [0.9, 0.05, 0.05, 0,
\dots, 0]^T\\), and \\(L\\) was defined as above, we would penalize the
network \\[L(\hat{f}(I)) = \frac{1}{2}\left((0.9 - 1)^2 + (0.05 - 0)^2 +
(0.05 - 0)^2\right) = .000525\\] points.


### How neural networks work {#how-neural-networks-work}

The structure of a neural network is more or less universally depicted
using a directed graph in which circular
nodes are arranged into parallel "layers" (columns) and connected by
edges.

Computation in neural networks proceeds layer-by-layer from left to
right. The leftmost (first) layer is called the _input_ layer, the
rightmost is called the _output_ layer, and all other layers are said to
be _hidden_.

At each node \\(k\\), the network computes a value \\[\begin{aligned} x\_k =
\psi\_k\left(b\_k + \sum\_{i \to k} w\_ix\_i\right),\end{aligned}\\] where

-   the sum runs over all nodes \\(i\\) that "feed into" (are direct
    predecessors of) \\(k\\);
-   \\(b\_k\\) and \\(w\_k\\) are real-valued parameters of node \\(k\\), called
    respectively the _bias_ and _weight_;
-   and \\(\psi\_k : \mathbb{R} \to \mathbb{R}\\) is a so-called _activation
    function_. Typically \\(\psi\\) will be a bounded nonlinear function for
    nodes in hidden layers and the identity for the output layer. Common
    choices of \\(\psi\\) include the hyperbolic tangent and the logistic
    function \\(e^x/(1 + e^x)\\).

In this paper, we will consider only _feedforward_ neural networks,
which require the directed graph to be acyclic. (This assumption is
relaxed in so-called _recurrent_ neural networks; see Section \\(6.2\\)
for more.) Also, we will assume for simplicity that every node in the
\\(n\\)th layer feeds into every node in the \\(n + 1\\)st layer.

We will use the label \\(\alpha\\) for the input layer; that is, we denote
the values of the nodes in the input layer \\(x\_{\alpha{}1}, \dots,
x\_{\alpha{}M}\\). Similarly, we label the hidden layers \\(1\\), \\(2\\),
..., \\(H\\), and we label the output layer \\(o\\). When a sum is
understood to run over all nodes in a given layer, we will be lax with
the limits of summation, e.g., \\(\sum\_l w\_{Hl}x\_{Hl}.\\)

Under these assumptions, we can rewrite equation (network) as

\\[\begin{aligned} x\_{ij} = \psi\_{ij}\left(b\_{ij} + \sum\_k w\_{(i -
1),k}x\_{(i - 1),k}\right) \end{aligned}\\]

where for instance \\(x\_{ij}\\) denotes the value computed at the \\(j\\)th
node (top-to-bottom) in the \\(i\\)th layer (left-to-right.)

Using the foregoing notation, we may also write the expression for the
loss function, equation (loss), as \\[\begin{aligned} L(\hat{f}(I)) =
L(x\_{o1}, \dots, x\_{oN}) = \frac{1}{2} \sum\_{k = 1}^N (y\_k - x\_{ok})^2
\end{aligned}\\] where we have written \\(f(I) = [y\_1, \dots, y\_N]^T\\) and
\\(\hat{f}(I) = [x\_{o1}, \dots, x\_{oN}]^T\\). This notation will be more
convenient in the sequel.


### How neural networks "learn" {#how-neural-networks-learn}

In principle, neural networks learn by a process similar to humans: they
attempt the task they are intended to perform many times, making
appropriate adaptations when they make a mistake. When we decide to use
neural network learning for some problem, we usually specify only the
network topology; feed it many, many examples; and allow backpropagation
to find the right weights and biases for us. This process is known as
_training_.


## Preliminaries {#preliminaries}

In this section we present the necessary prerequisites for appreciating
the main results: the backpropagation algorithm on Euclidean domains
(\\(\mathbb{R}^n\\)), following chapter 2 of [Nielsen 2015], and the
generalization to time scales calculus of the necessary concepts from
multivariable differential calculus, following [Bohner & Guseinov 2004].


### Backpropagation on \\(\mathbb{R}\\) {#backpropagation-on-mathbbr}

As already said, the backpropagation algorithm is responsible for
finding the weights and biases that minimize the loss function. This is
done iteratively by _gradient descent_. Suppose we have already computed
the network's output \\(\hat{f}(I)\\) for some training example \\(I\\).
Then for each node \\(x\_k\\), we compute the partials

\\[L\_{w\_k} = \frac{\partial L}{\partial w\_k}, L\_{b\_k} = \frac{\partial
L}{\partial b\_k}\\]

and update the parameters according to the _delta rule_

\\[\begin{aligned} \Delta w\_k &= -\beta L\_{w\_k}, \\ \Delta b\_k &= -\beta
L\_{b\_k}, \end{aligned}\\]

where \\(\beta > 0\\) is a constant (referred to as the _learning rate_.)

Backpropagation computes all the partials simultaneously by recursive
total differentiation of []. For simplicity we focus on the partial with
respect to a single parameter. Suppose we want to compute \\(L\_{w\_k} =
L\_{w\_{ij}}\\) for some node \\(k\\) (the computation of \\(L\_{b\_k}\\) will
proceed in an entirely similar way.) Recall that \\(L\\) takes the values
of nodes in the output layer as its inputs; so by the chain rule,

\\[\begin{aligned} \frac{\partial L}{\partial w\_{ij}} &= \sum\_k
\frac{\partial L}{\partial x\_{ok}} \frac{\partial x\_{ok}}{\partial
w\_{ij}} = \sum\_k (y\_k - x\_{ok}) \cdot \frac{\partial x\_{ok}}{\partial
w\_{ij}}. \end{aligned}\\]

In turn, since \\(x\_{ok}\\) depends on every node in the last hidden
layer, as well as those nodes' weights and its own bias, we have

\\[\begin{aligned} \frac{\partial x\_{ok}}{\partial w\_{ij}} &=
\frac{\partial x\_{ok}}{\partial b\_{ok}} \frac{\partial b\_{ok}}{\partial
w\_{ij}} + \sum\_l \left(\frac{\partial x\_{ok}}{\partial x\_{Hl}}
\frac{\partial x\_{Hl}}{\partial w\_{ij}} + \frac{\partial
x\_{ok}}{\partial w\_{Hl}} \frac{\partial w\_{Hl}}{\partial w\_{ij}}\right).
\end{aligned}\\]

For the moment, we assume that \\(w\_{ij}\\) is independent of all the
other weights and all the biases. Thus this equation becomes

\\[\begin{aligned} \frac{\partial x\_{ok}}{\partial w\_{ij}} &= \sum\_l
\frac{\partial x\_{ok}}{\partial x\_{Hl}} \frac{\partial x\_{Hl}}{\partial
w\_{ij}}. \end{aligned}\\]

Similarly, we have

\\[\begin{aligned} \frac{\partial x\_{Hk}}{\partial w\_{ij}} &= \sum\_l
\frac{\partial x\_{Hk}}{\partial x\_{(H - 1),l}} \frac{\partial x\_{(H -
1),l}}{\partial w\_{ij}}. \end{aligned}\\]

In this way, we work our way back (or _backpropagate_) through the
network until we reach the layer that directly depends on \\(w\_{ij}\\), at
which point the terms corresponding to weight partials are no longer all
zero, and we can compute directly

\\[\begin{aligned}
\frac{\partial x\_{(i + 1),k}}{\partial w\_{ij}} &= \frac{\partial}{\partial w\_{ij}} \left[\psi\_{(i+1),k}\left(b\_{(i + 1),k} + \sum\_l w\_{il}x\_{il}\right)\right] \\\\\\
&= \psi'\_{(i+1),k}\left(b\_{(i + 1),k} + \sum\_l w\_{il}x\_{il}\right) \cdot x\_{ij}.
\end{aligned}\\]

The weight can now be adjusted according to


### Ordered derivatives {#ordered-derivatives}

In the previous section we assumed that \\(w\_{ij}\\) was independent of
all the other \\(w\_{i'j'}\\) and also of the biases \\(b\_{i'j'}\\). This is
okay for the foregoing derivation, in which we assumed all the other
parameters were being held constant. However, actual implementations of
backpropagation update all the parameters simultaneously. Hence this
assumption is no longer valid; in particular, the change in the weight
(and bias) of a given node affects all of its successors.

To remedy this, [Werbos 1990] introduced an "ordered chain rule" that
accounts for these indirect effects. We present it below without proof.
A time scales version (for delta derivatives) is proven and rigorously
exposited in [Seifertt & Wunsch 2010] as Theorem 2.

Define the variables \\(x\_i = f(x\_1, \dots, x\_{i - 1})\\) recursively.
Then the "ordered derivative" of \\(x\_j\\) with respect to \\(x\_i\\) is
given by

\\[\begin{aligned} \frac{\partial^+ x\_j}{\partial x\_i} = \frac{\partial
x\_j}{\partial x\_i} + \sum\_{k = i, \dots, j} \frac{\partial^+
x\_j}{\partial x\_k} \frac{\partial x\_k}{x\_i}. \end{aligned}\\]

The sum in the definition of the ordered derivative accounts for the
indirect effects incurred by updates in the variables computed "after"
\\(x\_i\\) but "before" \\(x\_j\\); that is, the variables through which
\\(x\_j\\) depends transitively on \\(x\_i\\).


### Univariate time scales calculus {#univariate-time-scales-calculus}

This section consists of a number of standard definitions which will be
immediately generalized. For a more complete treatment of
single-variable time scales calculus in which these results appear, see
[Bohner & Peterson 2012].

A _time scale_ is a nonempty closed subset of \\(\mathbb{R}\\).

In the sequel, we use \\(\mathbb{T}\\) to refer to an arbitrary time
scale.

We define the _backward jump function_ \\(\rho : \mathbb{T} \to
\mathbb{T}\\) by

\\[\rho(t) \coloneqq \sup{ \mathbb{T} \cap (\infty, t) }\\]

and the _backward graininess function_ \\(\nu : \mathbb{T} \to [0,
\infty)\\) by

\\[\nu(t) \coloneqq t - \rho(t).\\]

Let \\(t \in \mathbb{T}\\). If \\(\nu(t) \> 0\\), we say \\(t\\) is _(left)
scattered_. Otherwise we say \\(t\\) is _(left) dense_.

Let \\(t \in \mathbb{T}\\) and let \\(f : \mathbb{T} \to \mathbb{R}\\). If
the limit \\[\begin{aligned} \lim\_{s \to t, s \not = \rho(t)}
\frac{f(\rho(t)) - f(s)}{\rho(t) - s} = f^\nabla(t) \end{aligned}\\]
exists as a finite number, we say that \\(f\\) is _nabla differentiable at
\\(t\\)_ and call \\(f^\nabla(t)\\) the _nabla derivative of \\(f\\) at
\\(t\\)_.

The following generalization of the univariate chain rule will be
necessary later. It appears for delta derivatives in [Bohner & Peterson
2012] as Theorem 1.90.

Suppose \\(f : \mathbb{R} \to \mathbb{R}\\) is \\(C^1\\). Suppose \\(g :
\mathbb{T} \to \mathbb{R}\\) is nabla differentiable. Then \\(f \circ g :
\mathbb{T} \to \mathbb{R}\\) is nabla differentiable and

\\[\begin{aligned} (f \circ g)^\nabla(t) = \int\_0^1 f'(g(t) +
h\nu(t)g^\nabla(t)) ~dh. \end{aligned}\\]

The definitions of the dual concepts (_e.g._, forward jump function,
right scattered point, delta derivative) may be easily inferred. We will
not need them in the remainder of this paper.


### Multivariate time scales calculus {#multivariate-time-scales-calculus}

We now consider products of time scales \\(\Lambda^n = \prod\_{i=1}^n
\mathbb{T}\_i\\). We regard these as time scales in their own right. Note
that each component time scale has its own (possibly distinct) backward
jump \\(\rho\_i\\) and backward graininess \\(\nu\_i\\).

Suppose \\(f\\) is defined on \\(\Lambda^n\\) and \\(\mathbf{t} = [t\_1,
\dots, t\_n]^T \in \Lambda^n\\). We define the backward jump on
\\(\Lambda^n\\) as follows.

\\[\begin{aligned} \rho(\mathbf{t}) &= [\rho\_1(t\_1), \dots, \rho\_i(t\_i),
\dots, \rho\_n(t\_n)]^T, \\ f^{\rho}(\mathbf{t}) &= f(\rho\_1(t\_1), \dots,
\rho\_i(t\_i), \dots, \rho\_n(t\_n)). \end{aligned}\\]

For compactness, we also make use of the following abuse of notation:

\\[\begin{aligned} \rho\_i(\mathbf{t}) &= [t\_1, \dots, \rho\_i(t\_i), \dots,
t\_n]^T, \\ f^{\rho\_i}(\mathbf{t}) &= f(t\_1, \dots, \rho\_i(t\_i), \dots,
t\_n). \end{aligned}\\]

The following definitions are given (for delta derivatives) in [Bohner &
Guseinov 2004].

Let \\(f : \Lambda^n \to \mathbb{R}\\). Let \\(\mathbf{t} = [t\_1, \dots,
t\_n]^T \in \Lambda^n\\). If the limit

\\[\begin{aligned} \lim\_{s\_i \to t\_i, s\_i \not = \rho\_i(t\_i)}
\frac{f^{\rho\_i}(\mathbf{t}) - f(t\_1, \dots, s\_i, \dots,
t\_n)}{\rho\_i(t\_i) - s\_i} = \frac{\partial f}{\nabla\_i t\_i}(\mathbf{t})
\end{aligned}\\]

exists as a finite number, we say that \\(f\\) is _nabla differentiable in
the \\(i\\)th variable at \\(\mathbf{t}\\)_ and call
\\(\displaystyle\frac{\partial f}{\nabla\_i t\_i}(\mathbf{t})\\) the _nabla
derivative of \\(f\\) with respect to \\(t\_i\\) at \\(\mathbf{t}\\)_.

To generalize the backpropagation algorithm, we will require the total
derivative of some functions to be well-defined. The following two
definitions provide an appropriate sufficient condition; a more explicit
(and lengthier) version that does not rely on vectors appears as
Definitions 2.1 and 2.3 in [Bohner & Guseinov 2004].

Let \\(f : \Lambda^n \to \mathbb{R}\\). Let \\(\mathbf{t} \in \Lambda^n\\).
Fix a positive \\(\varepsilon\\). If there exists a vector
\\(\mathbf{A}(\mathbf{t}) = \mathbf{A} \in \mathbb{R}^n\\) such that for
any \\(\mathbf{s} \in \Lambda^n\\) with \\(\Vert\mathbf{t} -
\mathbf{s}\Vert\\) less than \\(\varepsilon\\) there are vectors
\\(\mathbf{a}\\), \\(\mathbf{b}\_{1,\dots,n} \in \mathbb{R}^n\\) such that

\\[\begin{aligned}
f(\mathbf{t}) - f(\mathbf{s}) &= (\mathbf{A} + \mathbf{a})\cdot(\mathbf{t} - \mathbf{s})
\end{aligned}\\]

and for \\(j = 1, \dots, n\\)

\\[\begin{aligned} f^{\rho\_j}(\mathbf{t}) - f(\mathbf{s}) &= (\mathbf{A} + \mathbf{b}\_j) \cdot (\rho\_j(\mathbf{t}) - \mathbf{s}), \end{aligned}\\]

and further \\(\lim\_{\mathbf{s} \to \mathbf{t}} \mathbf{a} =
\lim\_{\mathbf{s} \to \mathbf{t}} \mathbf{b}\_j = \mathbf{0}\\), we say
\\(f\\) is _completely nabla differentiable at \\(\mathbf{t}\\)_.

In this definition the vector \\(\mathbf{A}\\) plays the role of the
gradient of \\(f\\); that is, if it exists, its \\(i\\)th component is equal
to \\(\frac{\partial f}{\nabla\_i t\_i}(\mathbf{t})\\).

Suppose \\(f : \Lambda^n \to \mathbb{R}\\) is completely nabla
differentiable at \\(\mathbf{t} \in \Lambda^n\\). Fix a positive
\\(\varepsilon\\). If there exists a vector \\(\mathbf{B}(\mathbf{t}) =
\mathbf{B} \in \mathbb{R}^n\\) which agrees with \\(\mathbf{A}\\) (as
defined above) in the \\(i\\)th component, viz.

\\[\begin{aligned} \mathbf{B}\_i &= \mathbf{A}\_i = \frac{\partial
f}{\nabla\_i t\_i}(\mathbf{t}), \end{aligned}\\] and for any \\(\mathbf{s}
\in \Lambda^n\\) with \\(\Vert\mathbf{t} - \mathbf{s}\Vert\\) less than
\\(\varepsilon\\) there exists \\(\mathbf{v} \in \mathbb{R}^n\\) such that
\\(\displaystyle\lim\_{\mathbf{s} \to \mathbf{t}} \mathbf{v} =
\mathbf{0}\\) and

\\[\begin{aligned} f^\rho(\mathbf{t}) - f(\mathbf{s}) &= (\mathbf{B} +
\mathbf{v}) \cdot (\rho(\mathbf{t}) - \mathbf{s}), \end{aligned}\\]

then we say \\(f\\) is _\\(\rho\_i\\)-completely nabla differentiable at
\\(\mathbf{t}\\)_.

If this condition holds, the components of \\(\mathbf{B}\\) other than the
\\(i\\)th are given by

\\[\begin{aligned} \mathbf{B}\_j = \frac{\partial f}{\nabla\_j
t\_j}(\rho\_i(\mathbf{t})).\end{aligned}\\]

The final definition we need will be used in the proof of the main
theorem.

Let \\(f : \Lambda^n \to \mathbb{T}\\). If
\\(f^{\rho\_{\Lambda^n}}(\mathbf{t}) = \rho\_{\mathbb{T}}(f(\mathbf{t}))\\),
we say that \\(f\\) is _backward jump commutative_ or _\\(ρ\\)-commutative_.


## Main results {#main-results}

We have now established the necessary scaffolding to generalize the main
theorem: the standard multivariate chain rule, the delta derivative
analog of which is proven in [Bohner & Guseinov 2004], Theorem 7.1 (in
two dimensions) and [Seifertt & Wunsch 2010], Theorem 1 (in \\(n\\)
dimensions.) We closely follow the latter proof here.

The definition of the functions \\(u\_i\\) in the theorem statement
requires a little care, since previously we defined nabla
differentiability only for functions whose image is \\(\mathbb{R}\\). We
assume throughout this discussion that the image of \\(u\_i\\),
\\(u\_i(\Lambda^n) = \mathbb{T}\_i \subseteq \mathbb{R}\\), is a time scale,
and is more specifically (a subset of) the \\(i\\)th component of
\\(\Lambda^n\\), so that the composite function \\(F\\) is well-defined.

Suppose \\(f : \Lambda^n \to \mathbb{R}\\) is \\(\rho\_1\\)-completely nabla
differentiable. Suppose \\(u\_i : \Lambda^n \to \mathbb{R}\\) is nabla
differentiable and \\(\rho\_i\\)-commutative for \\(i = 1, \dots, n\\).

Define \\(F : \Lambda^n \to \mathbb{R}\\) by \\[F(\mathbf{t}) =
f(\mathbf{u}(\mathbf{t})) = f(u\_1(\mathbf{t}), \dots,
u\_n(\mathbf{t})).\\] The nabla derivative of \\(F\\) exists and is given by

\\[\begin{aligned} F^\nabla(\mathbf{t}) &= \frac{\partial F}{\nabla\_1
u\_1}(\mathbf{t}) \cdot u\_1^\nabla(\mathbf{t}) + \sum\_{k = 2}^n
\frac{\partial F}{\nabla\_k u\_k}(\rho\_1(\mathbf{t})) \cdot
u\_k^\nabla(\mathbf{t}). \end{aligned}\\]

Let \\(\varepsilon > 0\\). Let \\(\mathbf{t} \in \Lambda^n\\) be given. A bit
loosely, we write \\[\begin{aligned} F^\nabla(\mathbf{t}) &=
\lim\_{\Vert\mathbf{s} - \mathbf{t}\Vert \to 0, \mathbf{s} \not =
\rho(\mathbf{t})} \frac{F(\rho(\mathbf{t})) -
F(\mathbf{s})}{\Vert\rho(\mathbf{t}) - \mathbf{s}\Vert}. \end{aligned}\\]
For simplicity, we will work with the numerator \\[\begin{aligned}
F(\rho(\mathbf{t})) - F(\mathbf{s}) &= f(u\_1(\rho(\mathbf{t})), \dots,
u\_n(\rho(\mathbf{t}))) - f(u\_1(\mathbf{s}), \dots, u\_n(\mathbf{s}))
\end{aligned}\\] and pass to the limit at the end. Therefore let
\\(\mathbf{s}\\) be fixed with \\(\Vert\mathbf{s} - \mathbf{t}\Vert\\) less
than \\(\varepsilon\\). Since the \\(u\_i\\) are \\(ρ\\)-commutative, we have

\\[\begin{aligned} F(\rho(\mathbf{t})) - F(\mathbf{s}) &=
f(\rho\_1(u\_1(\mathbf{t})), \dots, \rho\_n(u\_n(\mathbf{t}))) -
f(u\_1(\mathbf{s}), \dots, u\_n(\mathbf{s})) \\ &= F^\rho(\mathbf{t}) -
F(\mathbf{s}). \end{aligned}\\]

Since \\(F\\) is \\(\rho\_1\\)-completely nabla differentiable, there exist \\(\mathbf{B}, \mathbf{v} \in \mathbb{R}^n\\)
such that \\(\lim\_{\mathbf{s} \to \mathbf{t}} \mathbf{v} = \mathbf{0}\\)
and

\\[\begin{aligned} F^\rho(\mathbf{t}) - F(\mathbf{s}) &= (\mathbf{B} +
\mathbf{v}) \cdot (\rho(\mathbf{u}(\mathbf{t})) -
\mathbf{u}(\mathbf{s})) \\ &= \sum\_{k = 1}^n
B\_k(\rho\_k(u\_k(\mathbf{t})) - u\_k(\mathbf{s})) \\ &\qquad+ \mathbf{v}
\cdot (\rho(\mathbf{u}(\mathbf{t})) - \mathbf{u}(\mathbf{s})).
\end{aligned}\\]

By (\ref{bi}) and (\ref{bj}), this is

\\[\begin{aligned} &= \left(\frac{\partial F}{\nabla\_1 u\_1}(\mathbf{t})
\right) (\rho\_1(u\_1(\mathbf{t})) - \mathbf{s}) \\ &\qquad+ \sum\_{k=2}^n
\left(\frac{\partial F}{\nabla\_k
u\_k}(\rho\_1(\mathbf{t}))\right)(\rho\_k(u\_k(\mathbf{t})) -
u\_k(\mathbf{s})) \\ &\qquad+ \mathbf{v} \cdot
(\rho(\mathbf{u}(\mathbf{t})) - \mathbf{u}(\mathbf{s})). \end{aligned}\\]

Now applying the \\(ρ\\)-commutativity condition in the other direction
gives

\\[\begin{aligned} &= \left(\frac{\partial F}{\nabla\_1 u\_1}(\mathbf{t})
\right) (u\_1(\rho(\mathbf{t})) - \mathbf{s}) \\ &\qquad+ \sum\_{k=2}^n
\left(\frac{\partial F}{\nabla\_k
u\_k}(\rho\_1(\mathbf{t}))\right)(u\_k(\rho(\mathbf{t})) - u\_k(\mathbf{s}))
\\ &\qquad+ \mathbf{v} \cdot (\mathbf{u}(\rho(\mathbf{t})) -
\mathbf{u}(\mathbf{s})). \end{aligned}\\]

As earlier discussed, we divide throughout by \\(\Vert\rho(\mathbf{t}) -
\mathbf{s}\Vert\\) and take the limit as \\(\Vert\mathbf{t} -
\mathbf{s}\Vert\\) approaches \\(0\\), which gives \\[\begin{aligned}
F^\nabla(\mathbf{t}) &= \frac{\partial F}{\nabla\_1 u\_1}(\mathbf{t})
\cdot u\_1^\nabla(\mathbf{t}) + \sum\_{k = 2}^n \frac{\partial F}{\nabla\_k
u\_k}(\rho\_1(\mathbf{t})) \cdot u\_k^\nabla(\mathbf{t}), \end{aligned}\\]
which was to be shown.

Now we generalize the earlier exposition of the backpropagation
algorithm, viz. -

Suppose we have a neural network governed by equations and j with the
single difference that the domain of \\(x\_{ij}\\) (and range of the
activation function \\(\psi\_{ij}\\)) is a time scale \\(\mathbb{T}\\).
Throughout we will assume that this time scale is the same for all
nodes, so independent of \\(i\\) and \\(j\\). We therefore write \\(\Lambda^n
= \mathbb{T}^n\\).

The following discussion follows [Seifertt & Wunsch 2010], section 4. We
would like to compute the partial nabla derivative
\\(\displaystyle\frac{\partial L}{\nabla w\_{ij}}\\) for some node \\(ij\\).
By the chain rule for \\(n\\) variables, we have

\\[\begin{aligned} \frac{\partial L}{\nabla w\_{ij}}(\mathbf{t}) &=
\frac{\partial L}{\nabla x\_{o1}}(\mathbf{t}) \cdot \frac{\partial
x\_{o1}}{\nabla w\_{ij}}(\mathbf{t}) + \sum\_{k > 1} \frac{\partial
L}{\nabla x\_{ok}}(\rho\_1(\mathbf{t})) \frac{\partial x\_{ok}}{\nabla
w\_{ij}}(\mathbf{t}). \end{aligned}\\]

Similarly,

\\[\begin{aligned} \frac{\partial x\_{ok}}{\nabla w\_{ij}}(\mathbf{t}) &=
\frac{\partial x\_{ok}}{\nabla x\_{H1}}(\mathbf{t}) \cdot \frac{\partial
x\_{H1}}{\nabla w\_{ij}}(\mathbf{t}) + \sum\_{l > 1} \frac{\partial
x\_{ok}}{\nabla x\_{Hl}}(\rho\_1(\mathbf{t})) \frac{\partial x\_{Hl}}{\nabla
w\_{ij}}(\mathbf{t}). \end{aligned}\\]

When we reach the layer that directly depends on \\(w\_{ij}\\), we have to
compute

\\[\begin{aligned} \frac{\partial x\_{(i + 1),k}}{\nabla w\_{ij}} &=
\left(\int\_0^1 \psi\_{(i+1),k}'\left(b\_{(i+1), k} + \sum\_l w\_{il} x\_{il} + h\nu(t)x\_{ij} \right)~dh \right) \cdot x\_{ij}. \end{aligned}\\]


### Linear regression on time scales {#linear-regression-on-time-scales}

Several other statistical learning techniques admit representations as
neural networks. As a simple application of the results just derived, we
recast multiple linear regression, one of the simplest possible models,
as a neural network, and work through the backpropagation algorithm on
time scales.

Suppose we have a neural network with no hidden layers, a single output
node, and \\(M\\) input nodes. Further, suppose all the activation
functions are the identity. (On \\(\mathbb{R}\\), by taking the activation
function at the output to be, e.g., the hyperbolic tangent, we obtain
_logit regression_.)

The network equation becomes

\\[\begin{aligned} x\_{o1} = y &= b\_y + \sum\_{k = 1}^M w\_{\alpha
k}x\_{\alpha k} \\ &= b\_y + \sum\_{k = 1}^M w\_kx\_k. \end{aligned}\\]

Suppose we use the loss function and observe an error \\(L(\hat{f}(I)) =
L = (y - \hat{y})^2/2\\). To update the parameters, we need to compute

\\[\begin{aligned} \frac{\partial L}{\nabla w\_k}(I) &= \frac{\partial
L}{\nabla y}(I) \frac{\partial y}{\nabla w\_k}(I) \\ &= -\frac{y -
\hat{y} + \nu(y - \hat{y})}{2} \cdot \frac{\partial y}{\nabla w\_k}(I)
\end{aligned}\\] Since \\(\psi\_k' = 1\\), we have

\\[\begin{aligned} \frac{\partial y}{\nabla w\_k} &= x\_k, \frac{\partial
L}{\nabla w\_k} &= \frac{y - \hat{y} + \nu(y - \hat{y})}{2}
x\_k.\end{aligned}\\]

The weight is now updated as \\(Δ w\_k = -β \dfrac{\partial
L}{\nabla w\_k}.\\) If \\(\beta = 1\\) and \\(\mathbb{T} = \mathbb{R}\\), then
this becomes \\(Δ w\_k = (y - \hat{y})x\_k.\\)


## Directions for future research {#directions-for-future-research}


### Clearer exposition {#clearer-exposition}

When discussing the mathematics of neural networks, it is easy to get
lost while keeping track of the various indices under study. The paper
[Seifertt & Wunsch 2010] compounds this problem by stating the
\\(n\\)-variable chain rule in full generality, which almost by necessity
skims over some delicate considerations regarding, _e.g._, the
well-definedness of the composite function \\(F\\). In this paper, I have
tried to clean up their exposition in hopes of greater readability

The standard treatment of the total derivative in \\(\mathbb{R}^n\\) is as
a certain linear mapping (see for instance [Spivak 1965].) This allows
full "vectorization" of the appropriate definitions, which eliminates
complex indicial notation. An equivalent treatment for products of time
scales \\(\Lambda^n\\) would be highly desirable, but is outside the scope
of this paper.


### Universal approximation {#universal-approximation}

On continuous domains, the power of feedforward neural networks is
demonstrated by the following result, which implies that neural networks
can (theoretically) be used to model any continuous function in
Euclidean space. This result was presented in various slightly different
forms by several papers in the late 1980s and early 1990s; we follow the
exposition in [Hornik 1991] here.

Suppose \\(\psi : \mathbb{R} \to \mathbb{R}\\) is continuous, bounded, and
nonconstant. Let \\(X \subset \mathbb{R}^N\\) be compact. Then a
feedforward neural network with a single hidden layer, all of whose
nodes have activation function \\(\psi\\), can represent a dense subset of
\\(C(X)\\).

Note the conditions on \\(\psi\\) force it to be nonlinear. Additionally,
the number of nodes in the hidden layer increases rapidly as the
function to be approximated becomes more complex. For the latter reason,
this result's direct applicability is extremely limited; it is useful
mainly as a demonstration that there are no broad classes of
well-behaved functions at which neural network modeling breaks down.

The proof of this theorem requires tools from functional analysis such
as the Riesz representation theorem and the Hahn-Banach theorem. While
analogs of these results have been shown for time scales (see [Huseynov
2012],) generalizing the Universal Approximation Theorem to time scales
is beyond the scope of this paper.


### Recurrent neural networks {#recurrent-neural-networks}

This paper's abstract mentioned time-series forecasting among the
applications of neural networks. For computational reasons, the
feedforward architectures we relied on in this paper are generally
insufficient for most applications involving a time domain.

_Recurrent neural networks_ were introduced to address these
applications in the late 1980s. They relax the acyclicity of feedforward
neural networks, allowing nodes to feed into themselves or into prior
layers. As a result, applying the total derivative rule to such a node
produces a dynamic equation specialized to the approriate time scale
(differential equations on \\(\mathbb{R}\\) and difference equations on
\\(\mathbb{Z}\\).)

The present paper applies backpropagation to non-uniform _spatial_
domains; an interesting application of time scales calculus would be to
generalize backpropagation through time to non-uniform time domains.


## References {#references}

Bohner, Martin, and Gusein Sh. Guseinov. "Partial differentiation on
time scales." _Dynamic systems and applications_ 13, no. 3-4 (2004):
351-379.

Bohner, Martin, and Allan Peterson. _Dynamic equations on time scales:
an introduction with applications._ Springer Science & Business Media,

1.

Ciresan, Dan Claudiu, Ueli Meier, Jonathan Masci, Luca Maria
Gambardella, and Jürgen Schmidhuber. "Flexible, high performance
convolutional neural networks for image classification." In
_Twenty-Second International Joint Conference on Artificial
Intelligence_. 2011.

Hornik, Kurt. "Approximation capabilities of multilayer feedforward
networks." _Neural networks_ 4, no. 2 (1991): 251-257.

Huseynov, Adil. "The Riesz representation theorem on time scales."
_Mathematical and Computer Modelling_ 55, no. 3-4 (2012): 1570-1579.

Nielsen, Michael A. _Neural networks and deep learning._ Determination
Press, 2015.

Schmidhuber, Jürgen. "Deep learning in neural networks: An overview."
_Neural networks_ 61 (2015): 85-117.

Seiffertt, John, and Donald C. Wunsch. "Backpropagation and ordered
derivatives in the time scales calculus." _IEEE transactions on neural
networks_ 21, no. 8 (2010): 1262-1269.

Spivak, Michael. _Calculus on manifolds: a modern approach to classical
theorems of advanced calculus._ W. A. Benjamin, Inc., 1965.

Werbos, Paul J. "Backpropagation through time: what it does and how to
do it." _Proceedings of the IEEE_ 78, no. 10 (1990): 1550-1560.
