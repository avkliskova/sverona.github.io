---
title: "0: Why?"
date: 2022-08-26
math: true
draft: true
---

If you are like me at the time of writing --- that is, rationalism-adjacent but not quite seeped intellectually in all the funny jargon{{% sidenote %}}and more than a little scared{{% /sidenote %}} --- all this about decision theory, alignment, Newcomb, Goodhart, Solomonoff induction, and so on may set off all kinds of alarms that you have trained over the years to avoid chasing ghosts and falling down rabbit holes.{{% sidenote %}}All hail the Basilisk! Iä! Iä! {{% /sidenote %}}

So, for those people, here is a quick overview of the foundations, which lie themselves down a cramped and twisty corridor of things you're expected to have read.

The folks I'm working with want to implement or ensure the implementation of a "friendly" superintelligent artifical general intelligence --- *a beneficent god.*

The canonical way of doing so in these circles involves something called [*Solomonoff induction*](https://www.lesswrong.com/posts/Kyc5dFDzBg4WccrbK/an-intuitive-explanation-of-solomonoff-induction), which is a kind of completely general method of statistical inference and prediction. The first problem with it is that it's completely and utterly computationally intractable. We shall pass over this.

Recently, [a second problem has been proposed.](https://www.lesswrong.com/posts/Tr7tAyt5zZpdTwTQK/the-solomonoff-prior-is-malign) It goes like this.

1. Solomonoff induction computes a sum over all Turing machines that output a particular string, weighted by their Kolmogorov complexity.
2. There probably exist Turing machines that simulate intelligent life.
3. Such intelligent life (let's call it a daemon) may be able to deduce that it's being simulated by someone running Solomonoff induction.
4. Having so reasoned, the daemon will infer that the output of its Turing machine depends in some way on the contents of its universe.
5. By manipulating its universe, the daemon may be able to write arbitrary output to ours.
6. Since we were using Solomonoff induction to decide something on the order of whether [detonating a nuclear bomb ignites the atmosphere](https://fas.org/sgp/othergov/doe/lanl/docs1/00329010.pdf), the daemon kills us all.

You may be thinking right now that this argument is absurd. I agree. Attempting to argue that this would happen *as written* is silly for several reasons, first among them being that Solomonoff is completely and utterly computationally intractable.{{% sidenote %}}If you really want to get into this you should go read [the post and its comments.](https://www.lesswrong.com/posts/Tr7tAyt5zZpdTwTQK/the-solomonoff-prior-is-malign){{% /sidenote %}}

However, this argument does act as an intuition pump, and as motivation for some means of distinguishing ourselves from the daemons we may conjure up.

This is what PreDCA and infra-Bayesianism purport to provide.
