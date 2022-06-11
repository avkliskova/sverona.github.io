---
title: Building RNSSNC 
description: The construction log for my self-hosted RSS aggregator.
author: S. Verona Malone
---

There is no RSS aggregator out there that does exactly what I want it to, and
I've nearly tried them all. Too many subscribe solely to the "email
architecture" with a list pane on the left and a view pane on the right. This
is not my ideal. [Fraidycat](https://fraidyc.at) opened my mind to what
aggregators are truly capable of, but it runs as an extension, and I'm not a
fan of Firefox or Chrome.{{% sidenote %}}Viva
[qutebrowser](https://qutebrowser.org). Google delenda est.{{% /sidenote %}} [Miniflux](https://miniflux.app/)
opened my eyes to self-hosting, but as with many other competent products, we have differences of opinion.

What I want, effectively, is [MathURLs](https://mathurls.com) but with any
feeds I choose. I wrote this as a child. I think I called it *The Electric
Stranger,* because it was solely for my own eyes and I could call it whatever I
wanted. I made a brushed-metal tiled background in GIMP and set up a cron job
to scrape things. It was great fun. I must have been 14 or 15. This predated
both Flexbox and CSS Grid, so I set the things in a bloody table.

I figured the other day it was time I tried again with modern web architecture.
My mind made the leap from "architecture" to "Renaissance architecture", and
*Renaissance* has that lovely double S, so I thought it'd be cute to name it
accordingly.

This sequence doubles as a quick reference guide to getting a MERN app up and
running without the use of [create-react-app](https://create-react-app.dev),
which I really don't care much for.

Happy hunting!
