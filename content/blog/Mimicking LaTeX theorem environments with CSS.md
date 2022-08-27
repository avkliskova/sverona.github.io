---
title: Mimicking LaTeX theorem environments with CSS
description: An attempt at professionally typeset math, with mixed success.
date: 2021-08-08
epistemic_status: my best guess
completion_status: in progress
tags: [css, code, latex, in-progress, 2021]
---

LaTeX supports "theorem environments," like this:

(Image)

These aren't hard to mimic with `:before` and `:after`:

```css
article {
  counter-reset: definition theorem lemma example proposition corollary;
}

.definition:before {
  counter-increment: definition;
  content: "Definition " counter(definition) ".";
  font-weight: bold;
}

.theorem:before {
  counter-increment: theorem;
  content: "Theorem " counter(theorem) ".";
  font-weight: bold;
}

.lemma:before {
  counter-increment: lemma;
  content: "Lemma " counter(lemma) ".";
  font-weight: bold;
}

.example:before {
  counter-increment: example;
  content: "Example " counter(example) ".";
  font-weight: bold;
}

.proposition:before {
  counter-increment: proposition;
  content: "Proposition " counter(proposition) ".";
  font-weight: bold;
}

.corollary:before {
  counter-increment: corollary;
  content: "Corollary " counter(corollary) ".";
  font-weight: bold;
}


p:first-child {
  display: inline;
}
```

One small problem:

(Why inlining is necessary)

So we just inline the first paragraph.

```
.definition p:first-child,
.theorem p:first-child,
.lemma p:first-child,
.example p:first-child,
.proposition p:first-child,
.corollary p:first-child {
	display: inline;
}
```

This is almost perfect. You may notice the proof environment is missing.

## Proofs, the easy way
Proofs are just like any other theorem environment, except they have an end-of-proof sign `U+25FB` on the far right of the last line. So you can just do:

```css

.proof {
	overflow: auto; /* Encompass floated children. */
}

.proof:before {
	content: "Proof. "
	font-style: italic;
}

.proof:after {
	content: "\25FB";
	float: right;
}
```

Except this doesn't quite work:

(Image)

Inlining fixes this, sort of:

```css
.proof > p:last-child:not(:nth-child(2)) {
  display: inline;
}

.proof > p:last-child:nth-child(2) {
  margin-block-end: 0;
}
```

The only corner case is when a proof contains exactly two paragraphs; they can't both be inlined, or they'll run together. I chose to sacrifice the end-of-proof symbol's placement, rather than the `:before`. CSS cannot style an element by its children yet, so this is as far as the logic can go.

## Handling KaTeX
Of course, a LaTeX renderer makes things more complicated, but not by much. The first problem we have is that under `overflow: auto`, proofs that contain display math will overflow their containers slightly. This is really annoying, especially on mobile. There are a few ways of fixing it, none of which I fully understand. I went with `display: table`, which I'm sure is bad practice, but it was the best out of what I tried.

```css
.proof {
  display: table;
  table-layout: fixed; /* Prevent container from stretching */
  width: 100%;
}

@media screen and (min-width: 900px) {
  .proof {
    width: calc(var(--content-proportion) * 100%);
  }
}
```

Another problem we have is rendering the end-of-proof symbol properly in proofs that end with display math. The usual LaTeX fix is `\qedhere`, but we obviously don't have that available to us.

_Or do we?_

The definition of `\qedhere` in the `amsthm` package is as follows:

```tex
%    Prints the current QED symbol and replaces the top entry on the
%    stack with a null entry.
%    \begin{macrocode}
\newcommand{\qedhere}{%
  \begingroup \let\mathqed\math@qedhere
    \let\qed@elt\setQED@elt \QED@stack\relax\relax \endgroup
}
%    \end{macrocode}
```

There's a stack involved. And the code goes on for pages after this. So no, the LaTeX way of placing the end-of-proof is not going to be emulated with KaTeX macros. We could possibly fake it with a macro for `\hfill \qedsymbol`, but [`\hfill` isn't implemented yet.](https://github.com/KaTeX/KaTeX/issues/164).

A satisfying solution to this requires either JavaScript or a deeper understanding of the structure KaTeX generates than I possess. I chose laziness rather than satisfaction:

```css
.proof > p:last-child > span:last-child .katex-display {
  margin: 1em 0 calc(1.6em * -1.1); /* Line-height times -1.1 */
}
```

It's not perfect --- especially when the last line of display math contains something like a `\sum` --- but it's good enough for me.

The complete code is here:

```css
.definition:before {
  counter-increment: definition;
  content: "Definition " counter(definition) ".";
  font-weight: bold;
}

.theorem:before {
  counter-increment: theorem;
  content: "Theorem " counter(theorem) ".";
  font-weight: bold;
}

.lemma:before {
  counter-increment: lemma;
  content: "Lemma " counter(lemma) ".";
  font-weight: bold;
}

.example:before {
  counter-increment: example;
  content: "Example " counter(example) ".";
  font-weight: bold;
}

.proposition:before {
  counter-increment: proposition;
  content: "Proposition " counter(proposition) ".";
  font-weight: bold;
}

.corollary:before {
  counter-increment: corollary;
  content: "Corollary " counter(corollary) ".";
  font-weight: bold;
}

.proof {
  display: table;
  width: 100%;
}

.corollary p:first-child,
.theorem p:first-child,
.definition p:first-child,
.proof p:first-child,
.lemma p:first-child,
.example p:first-child {
  display: inline;
}

.corollary,
.theorem,
.definition,
.proof,
.lemma,
.example {
  margin-block: 1rem;
}

.proof:before {
  content: "Proof. ";
  font-style: italic;
}

.proof:after {
 	content: "\25FB";
  float: right;
}

.proof > p:last-child:not(:nth-child(2)) {
  display: inline;
}

.proof > p:last-child:nth-child(2) {
  display: inline-block;
  margin-block-end: 0;
}

.proof > p:last-child > span:last-child .katex-display {
  margin: 1em 0 calc(-1.6em * 1.1);
}
```
