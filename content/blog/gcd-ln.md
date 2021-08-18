---
title: \(\pi\) and \(e\) and the GCD
description: A quick exercise in probability.
date: 2021-01-24
epistemic_status: confident
completion_status: complete
tags: [mathematics, probability, combinatorics, asymptotics, fun, 2021]
---

While doing some research for my Project Euler post, I found myself drawn to something else that blew my mind in high school --- the connection between the greatest common divisor and the Riemann zeta function.

For those of you just joining us:

1.  The _greatest common divisor_ of two nonzero integers is the largest _positive_ number that divides them both.
2.  The _Riemann zeta function_ is the series \\[\zeta(s) = \sum\_{n = 1}^\infty \frac1{n^s} = \frac1{1^s} + \frac1{2^s} + \frac1{3^s} + \cdots.\\]

How are these things related? Well, someone started wondering about the _probability distribution_ of the GCD. More rigorously, they asked: _With what probability is the GCD of two randomly chosen positive integers equal to 1_?


## The GCD and \\(\pi\\) {#the-gcd-and-pi}

I've given away the plot already, \\(\zeta(s)\\) shows up in the answer, but what's really going on here?
Well, the probability that two given positive integers are both divisible by \\(n\\) is exactly \\(1/n^2\\)! And for the GCD to be equal to 1, we have to eliminate the possibility of any integer _bigger than_ 1 dividing both. You might try just subtracting stuff, and write


\\[
\begin{aligned}
P(\gcd(a, b) = 1) &= 1 - \frac{1}{2^2} - \frac{1}{3^2} - \cdots \newline
&= 1 - (\zeta(2) - 1).
\end{aligned}
\\]

Unfortunately this doesn't work, because we've double-counted some probabilities. Actually, it's worse, because we've infinite-counted infinitely many probabilities. Consider again the probability

\\[\begin{aligned}
\frac1{n^2} &= P(n \mid a \land n \mid b) \newline
&= P(n \mid \gcd(a, b)).
\end{aligned}\\]

This is in fact the probability that the GCD is \\(kn\\) for some natural number \\(k.\\) Our initial idea works with some modification, though:

\\[\begin{aligned}
P(\gcd(a, b) = 1) = 1 - \sum\_{n = 2}^\infty P(\gcd(a, b) = n).
\end{aligned}\\]

And because \\(\gcd(a, b) = n\\) if and only if \\(n \mid \gcd(a, b)\\) and \\(\gcd(a/n, b/n) = 1,\\) we have

\\[\begin{aligned}
P(\gcd(a, b) = n) &= \frac{P(\gcd(a/n, b/n) = 1)}{n^2} \newline
&= \frac{P(\gcd(a', b') = 1)}{n^2}.
\end{aligned}\\]

Substituting this back, we get

\\[\begin{aligned}
P(\gcd(a, b) = 1) = 1 - \sum\_{n = 2}^\infty \frac{P(\gcd(a', b') = 1)}{n^2}.
\end{aligned}\\]

The probability doesn't care about what we're calling the variables inside the GCD, so we can write

\\[\begin{aligned}
1 &= P(\gcd(a, b) = 1) + \sum\_{n = 2}^\infty \frac{P(\gcd(a', b') = 1)}{n^2} \newline
&= \sum\_{n = 1}^\infty \frac{P(\gcd(a, b) = 1)}{n^2} \newline
&= \zeta(2) \cdot P(\gcd(a, b) = 1) \newline
\implies& \boxed{P(\gcd(a, b) = 1) = \zeta(2)^{-1} = \frac{6}{\pi^2}.}
\end{aligned}\\]

(You may say "you cheater, you're skipping over the fact that \\(\zeta(2) = \pi^2/6.\\)" You'd be right, but it's practically mathematical apocrypha at this point; if you want to see a really cool perspective, check out 3Blue1Brown's [video](https://www.youtube.com/watch?v=d-o3eB9sfls) on the subject.)


## The GCD and \\(e\\) {#the-gcd-and-e}

Now, if you've had a probability course, you might ask: _what's the expected GCD of two numbers?_ It should be
\\[\begin{aligned}
E[\gcd(a, b)] &= \sum\_{n = 1}^\infty P(\gcd(a, b) = n) \cdot n \newline
&= \frac{6}{\pi^2} \cdot 1 + \sum\_{n = 2}^\infty \frac{1}{n^2} \cdot n \newline
&= \frac{6}{\pi^2} + \sum\_{n = 2}^\infty \frac1n,
\end{aligned}\\]

which diverges. So let's compromise and take an upper limit \\(N \in \mathbb N\\):

\\[\begin{aligned}
    E[\gcd(a, b) \mid \gcd(a, b) \leq N] &= \sum\_{n=1}^\infty P(\gcd(a, b) = n \mid \gcd(a, b) \leq N) \cdot n \newline
    &= \sum\_{n = 1}^N P(\gcd(a, b) = n \mid \gcd(a, b) \leq N) \cdot n \newline
    &= \sum\_{n=1}^N \frac{P(\gcd(a, b) = n)}{P(\gcd(a, b) \leq N)} \cdot n\newline
    &= \frac{\sum\_{n=1}^N P(\gcd(a, b) = n) \cdot n}{P(\gcd(a, b) \leq N)} \newline
    &= \frac{\sum\_{n=1}^N P(\gcd(a, b) = n) \cdot n}{\sum\_{n=1}^N P(\gcd(a, b) = n)}.
\end{aligned}\\]

From before, we know that \\(P(\gcd(a, b) = n) = 6/(\pi^2 n^2)\\), so this becomes
\\[\begin{aligned}
E[\gcd(a, b) \mid \gcd(a, b) \leq N] &= \frac{\sum\_{n=1}^N 6/\pi^2 \cdot 1/n}{\sum\_{n=1}^n 6/\pi^2 \cdot 1/n^2} \newline
&= \frac{\sum\_{n=1}^N 1/n}{\sum\_{n=1}^N 1/n^2}.
\end{aligned}\\]

As \\(N\\) becomes large, we then have the approximation

\\[ \boxed{E[\gcd(a, b) \mid \gcd(a, b) \leq N] \approx \frac{\ln N + \gamma}{\pi^2/6},} \\]
where \\(\gamma\\) is the Euler-Mascheroni constant.

Now you may say that this is a false attempt at beauty constructed by someone who should write better blog posts. You may be right, but I will point out that should you actually want to compute this, the definition is computable only in linear time, whereas the approximation is constant-time.

## Another problem

While I was explaining this to my boyfriend, I realized that I should try to compute the expected GCD of two numbers given that _the numbers_, rather than their GCD, are below a specific limit. Let's see.

(Exposit this a little bit)

For a given upper limit \\(N\\) and required GCD \\(n\\), there are \\(2 \Phi(\lfloor N / n \rfloor) - 1\\) satisfactory pairs, so we have
\\[\begin{aligned}
P(\gcd(a, b) = n | a, b \leq N) &= \frac{2 \Phi(\lfloor N/n \rfloor) - 1}{n^2},
\end{aligned}\\]

and hence

\\[\begin{aligned} 
E[\gcd(a, b) \mid a, b \leq N] &= \sum\_{n=1}^\infty P(\gcd(a, b) = n \mid a, b \leq N) \cdot n \newline
&= \sum\_{n=1}^N P(\gcd(a, b) = n \mid a, b \leq N) \cdot n \newline
&= \sum\_{n=1}^N \frac{2\Phi(\lfloor N / n \rfloor) - 1}{n},
\end{aligned}\\]

which is nearly intractable. Passing to the asymptotic \\(\Phi(n) \approx 3n^2/\pi^2\\), we get

\\[\begin{aligned}
E[\gcd(a, b) \mid a, b \leq N] &\approx \sum\_{n=1}^N \frac{6\lfloor N / n \rfloor^2 - 1}{n\pi^2} \newline
&\approx \frac{6}{\pi^2} \sum\_{n=1}^N \frac1n \left\lfloor \frac{N}{n} \right\rfloor^2 - \frac{\ln N + \gamma}{\pi^2}.
\end{aligned}\\]

I don't think this can be further simplified. It looks kind of like Mobius inversion, but the summation is wrong. Maybe there's a fun trick to be found, but I don't see it.

It's really fascinating how deeply the GCD and \\(\pi\\) are linked. I have absolutely no idea why.
