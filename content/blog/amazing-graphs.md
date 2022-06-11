---
title: Refurbishing an old Twitter bot
description: Cheap bots done at my own pace. 
date: 2022-05-18
---

Some time ago Numberphile released a [series](https://www.youtube.com/watch?v=pAMgUB51XZA) [of](https://www.youtube.com/watch?v=o8c4uYnnNnc) [videos](https://www.youtube.com/watch?v=j0o-pMIR8uk) concerning [sequences in the OEIS with pretty plots.](http://oeis.org/search?q=keyword%3Alook&language=english&go=Search) Inspired, I wrote a [little Twitter bot](https://twitter.com/amazing_graphs) that tweets out two such plots each day. I even got a follow from [3Blue1Brown](https://www.3blue1brown.com/). It was a wonderful source of dopamine for a while.

Because I hacked the thing together in a day{{% sidenote %}}You can check out the [source code](https://cheapbotsdonequick.com/source/amazing_graphs), if you're okay with your eyes melting out of your skull.{{% /sidenote %}} with [CheapBotsDoneQuick](https://cheapbotsdonequick.com), it really did not work all that well. The tweets weren't well formatted, and usually failed to get the entire sequence description.{{% sidenote %}}Compare [this tweet](https://twitter.com/amazing_graphs/status/1526449853898797056) to [the sequence it references.](https://oeis.org/A322341) Note the strange cutoff and double period.{{% /sidenote %}}

I forgot about it for some time. Then I decided, "you know what, I need to learn how to deploy stuff --- let's do this again and do it right this time."

## Design considerations

On paper, this is a pretty simple case of stitching two APIs together --- just wire the [OEIS API](https://stackoverflow.com/questions/5991756/programmatic-access-to-on-line-encyclopedia-of-integer-sequences) up to the [Twitter API](https://tweepy.org/) and turn it loose.

Of course, there are some hiccups.

### Hiccup: The OEIS API only returns ten results at a time

So you just cache them, right? Well, sure. Except ---

### Hiccup: The OEIS updates all the time

These updates principally consist of new sequences, but also amendments to previously posted sequences --- including, possibly, old sequences being furnished with the "look" tag. My cursory research didn't turn up any such examples, but this is the kind of thing a good design would handle, right?

### Solution: Periodically rescrape

This means that --- *ugh* --- I have to actually write a proper well-designed scraper instead of just building one to pull the data I need one time only, jig-style.{{% sidenote %}}I wonder, do carpenters and machinists think about the design of their jigs in the same way?{{% /sidenote %}} This is fine, honestly. It's a bad habit I have, and my thirsty student brain quite enjoys getting to read what other people have written about good scraper design.{{% sidenote %}}See [Will Larson](https://lethain.com/an-introduction-to-compassionate-screenscraping/) and [Library Carpentry.](https://librarycarpentry.org/lc-webscraping/05-conclusion/index.html){{% /sidenote %}}

I'm going with a biweekly{{% sidenote %}}Which is to say, [twice monthly.](https://www.lawlessenglish.com/english-mistakes/bi-vs-semi/){{% /sidenote %}} update interval. This is arbitrary based on my assessment of the OEIS's update frequency --- it only gets a few new "look" sequences a month. Updates to sequence descriptions happen pretty much every day, but those can be mostly ignored. Fortunately, the OEIS has an option to [order by modification date,](http://oeis.org/search?q=keyword%3Alook&sort=modified) and these dates are [exposed in the JSON API.](http://oeis.org/search?q=keyword%3Alook&start=10&sort=modified&fmt=json) Easy peasy. We don't even need BeautifulSoup.

The cache will look like a SQL table, or perhaps just a dict since the only information we really need is the sequence number and the modified date. We don't need to bother caching the plots; we can just send a single request at tweet time. So we could read and write from a CSV. It's probably going to be better practice to read a SQL table, though, so we'll go with that.

## Scraper logic
Every `$SCRAPE_INTERVAL`:

1. Send a sequence of `GET`s to `https://oeis.org/search` to fetch any sequences matching criteria and modified since `$LAST_SCRAPE_DATE`, which defaults to epoch time 0.
2. Turn those into an `INSERT`/`UPDATE` that runs against the cache table.
3. Update `$LAST_SCRAPE_DATE`.

## Bot logic

Every `$POST_INTERVAL`:
  1. Select a random sequence that hasn't been tweeted in `$COOLDOWN_INTERVAL`.
  2. Pull its scatterplot(s), viz. `GET https://oeis.org/A<sequenceNumber>/graph?png=1`. Using PIL, slice these apart.
  3. Format a tweet following [this general pattern.](https://twitter.com/amazing_graphs/status/1527355819213279235) If the sequence description runs over 280 characters, split it between two tweets. Attach the scatterplot(s).
  4. Send tweet. On success, `UPDATE` that sequence's last posted date.

## Deployment hassles

Everyone's favorite part of building an app, no?

First I had to do some backflips to retrieve the password for the Twitter account, which took a couple of days thanks to rate limits.

Then, because my tweets included media, I needed to use the [v1.1 API](https://developer.twitter.com/en/docs/twitter-api/v1), which requires [elevated access](https://developer.twitter.com/en/portal/products/elevated). This necessitated a written application and some other boring things, which ate up another day.

Having done all of that, I was finally able to tweet automatically from my own computer. Now I merely had to deploy on a [PythonAnywhere](https://pythonanywhere.com) account.

My first instinct was to migrate the SQLite database I'd been using in development to a proper MySQL database. This ran into all kinds of hiccups:

1. Arch uses [MariaDB](https://wiki.archlinux.org/title/MariaDB) rather than MySQL. Not knowing this, I chose to install the spottily-maintained AUR package, which happily compiled for about two hours and then errored. Figuring out what was going on, and then jumping through the appropriate hoops to configure MariaDB, took up most of a day.
2. [The default Python MySQL library](https://mysqlclient.readthedocs.io/user_guide.html) could stand to have its documentation updated. This wasn't really a problem, though; the docs were perfectly *serviceable*, just not the gold-standard that I've gotten used to/been spoiled by from the big Python packages over the years.
3. Of course there are slight flavor differences between SQLite and MySQL, but those were easy fixes.
4. The one that did me in was how much of a pain migrating a MySQL database to another server was. I *could* have just reran the scraper, but this would've taken a couple of days, given the amount of CPU time I was allotted. So eventually I just gave up and copied over my SQLite file. It was small enough (<1MB) that it wouldn't be a huge deal.{{% sidenote %}}Had it ended up being a huge deal I would simply have loaded the SQLite records into a MySQL database *from the server.*{{% /sidenote %}}

The only other hiccup of note was the usual hassles with getting anything to run on another machine, but those really aren't worth mentioning. 

Something that I thought was a hiccup but that ended up not being a huge deal was the 140-character limit. Of course, Twitter's character limit is 280 as of a while ago. However, it's not quite so easy in the v1.1 API, which [distinguishes](https://developer.twitter.com/en/docs/twitter-api/premium/data-dictionary/overview) between "extended" (280-character) tweets and 140-character tweets. My understanding is that this was done to avoid breaking changes in applications that expect a character limit of 140; no such distinction exists in the v2 API, which went live after the limit was increased.

The final piece of the puzzle was getting the right scrape and tweet intervals in PythonAnywhere's setup. Annoyingly, while they describe their [scheduled tasks](https://help.pythonanywhere.com/pages/ScheduledTasks/) feature as implementing a simple `cron`, the only options are daily and hourly.{{% sidenote %}}A representative told me that there are no plans to go much beyond this.{{% /sidenote %}} Fortunately, `cron` in pure Python already exists (I used [pycron](https://github.com/kipe/pycron)) and integrating it is as simple as guarding your `__main__()` behind an `if`.

## Takeaways

Deployment isn't a big scary beast! Especially if you're running a single, trivial application on a single server. If you're already handy with Linux, it's no harder than what you did to get it running on your own machine.

It's nice to sit down and get something nice and cute up and running within about 10 they-hours of development time, stretched over a couple weeks. Like, one day the other week I decided I needed a shelf for my windowsill garden. So, rather than buying anything on the internet, I went out to the garage, found a relatively sane piece of scrap wood, sketched out a design, and sawed and hammered the thing together myself. I was done that same day. It was a lot of fun and I was distinctly proud of myself, considering that I never learned anything about carpentry as a kid. Having actually finished a project within a couple weeks feels a bit like that, except more abstract and with more steps.
