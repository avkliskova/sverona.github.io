---
title: Project Euler 1-100 in 49 hours
description: The things I do for my inner child.
date: 2021-01-20
completion_status: complete
epistemic_status: confident
tags: [code, fun, challenge, project-euler, 2021]
---

[Project Euler](https://projecteuler.net) is how I taught myself Python in high school, and so I find it incredibly nostalgic. It took 13-year-old me a lot of Googling and a few months to get through the first 100 problems.

10-odd years and a graduate degree later, I decided to come back and solve them as fast as I could. I'm no competitive programmer, but 24 hours seemed reasonable. Fortunately, I lack the stamina to code for that long, so I did it over a few days instead. I started on 19 January a little after 1400 and finished two days later at 1500, and probably spent less than half of that time coding, but who knows.

(Why 100 specifically? Because I wanted to write this post honestly and those are the ones I'm allowed to talk about without them locking my account or something.)


## How this was possible in the first place {#how-this-was-possible-in-the-first-place}

Having solved them all before helped a lot --- otherwise I wouldn't be sure this was possible to do quickly at all. Problems after 100 tend to very quickly become about number theory; I've solved more than one by appeal to my copy of Hardy and Wright.

I wrote my solutions in Python, as before. Having just done [Advent of Code](https://adventofco.de) in plain C, I came to miss my dictionaries, lists, and not having to write `unsigned long long` everywhere.


## Useful things from my graduate algorithms class {#useful-things-from-my-graduate-algorithms-class}

[Problem 67](https://projecteuler.net/problem=67) was how I learned about dynamic programming in high school.


## Utility algorithms {#utility-algorithms}

If you're trying this in another language, these are the things I would implement first.


### Converting between a number and its digits {#converting-between-a-number-and-its-digits}

```python
def digits(n):
    return [int(d) for d in str(n)]

def from_digits(digits):
    return int(''.join(str(d) for d in digits))
```


### Euclid's GCD algorithm {#euclid-s-gcd-algorithm}

```python
def gcd(a, b):
    return a if b == 0 else gcd(b, a % b)
```


### Primality testing {#primality-testing}

```python
def is_prime(n):
    if n < 2:
        return False
    max_d = int(n ** 0.5)
    for d in range(2, max_d + 1):
        if n % d == 0:
            return False
    return True
```


### Sieve of Eratosthenes {#sieve-of-eratosthenes}

```python
def sieve(max_n):
    sv = [None for n in range(max_n + 1)]
    sv[0] = False
    sv[1] = False

    max_p = int(max_n ** 0.5)
    for p in range(2, max_p + 1):
        if sv[p] is None:
            sv[p] = True
        for c in range(p * p, max_n + 1, p):
            sv[c] = False
    for p in range(max_p + 1, max_n + 1):
        if sv[p] is None:
            sv[p] = True

    return sv
```

Sieving other things was also appropriate; for instance, Euler's totient function, in view of the identity
\\[
\varphi(n) = n \cdot \prod\_{\substack{p \mid n}} \frac{p-1}p.
\\]


### Factorization {#factorization}

```python
def factors(n):
    n_ = n
    max_d = int(n ** 0.5)
    for d in range(2, max_d + 1):
        if n_ < d:
            break
        if is_prime(d) and n_ % d == 0:
            mult = 0
            while n_ % d == 0:
                n_ //= d
                mult += 1
            yield (d, mult)
    if n_ > 1:
        yield (n_, 1)
```


### Generating Pythagorean triples {#generating-pythagorean-triples}

They really like their Pythagorean triples at Project Euler. The code below generates all the primitive triples \\((a, b, c)\\) with \\(c\\) less than a provided bound, then their multiples.

```python
def pyth(max_c):
    max_m = int((max_c / 2) ** 0.5)

    for m in range(1, max_m + 1):
        for n in range(1, m):
            a = m * m - n * n
            b = 2 * m * n
            c = m * m + n * n
            max_k = max_c // c
            for k in range(1, max_k + 1):
                yield (k * a, k * b, k * c)
```


### Others {#others}

The **extended Euclidean algorithm**, which is convenient for generating modular inverses for something like the Chinese Remainder Theorem (which wasn't necessary here, but definitely is later on.)

**Generating continued fractions**, particularly of quadratic surds.

For later problems, **a fast primality test** is a good idea. Here's the Miller-Rabin test:

```python
def is_probably_prime(n, witnesses=None):
    if n < 2:
        return False

    if not witnesses:
        witnesses = [2, 3, 5, 7, 11, 13, 17]

    if n in witnesses:
        return True

    odd_divisor = n - 1
    power_of_two = 0
    while odd_divisor & 1 == 0:
        power_of_two += 1
        odd_divisor //= 2

    for witness in witnesses:
        x = pow(witness, odd_divisor, n)
        if x not in [1, n - 1]:
            for _ in range(power_of_two - 1):
                x = (x * x) % n
                if x == n - 1:
                    break
            else:
                return False
    return True
```

This is valid up to about \\(n = 3.4 \times 10^{14},\\) which exceeds most of the answer bounds in early problems. Using the witness set \\(\\{2, 7, 61\\}\\) may provide a slight speed boost, but if you're hyperoptimizing your solutions like that this post probably isn't for you.
