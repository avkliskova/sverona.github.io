---
title: LeechBlock in qutebrowser
date: 2022-07-07
description: My anti-doomscrolling apparatus.
---

I use [qutebrowser](https://github.com/qutebrowser/qutebrowser) as my daily driver. With the exception of the errant ad that Firefox or Chrome would catch,{{% sidenote %}}An [active area of research.](https://github.com/qutebrowser/qutebrowser/issues/6480){{% /sidenote %}} there is nothing to complain about.

Unfortunately I've developed a nasty habit of unthinkingly typing in anxiogenic websites. The usual solution on Chrome/Firefox is [LeechBlock](https://www.proginosko.com/leechblock/), but qutebrowser naturally doesn't support extensions.{{% sidenote %}}I'm honestly fine with this design choice; most of the extensions I would need are implementable as user stylesheets/scripts/plugins, this one included. Keep it simple, S.{{% /sidenote %}}

Fortunately, it *does* have [an interface](https://github.com/qutebrowser/qutebrowser/blob/master/qutebrowser/browser/webengine/interceptor.py) to intercept outgoing requests. Even more fortunately, [Jay Kamat](http://jgkamat.gitlab.io/) wrote [most of the plumbing for what I need.](https://gitlab.com/jgkamat/dotfiles/-/blob/master/qutebrowser/.config/qutebrowser/pyconfig/redirectors.py)

The following is graciously adapted from its code:

```python
from typing import Literal

from qutebrowser.api import interceptor
from PyQt5.QtCore import QUrl

BREATHER = [
    # Sites to block here...
]


def redirect_to(qurl: QUrl) -> QUrl | Literal[False]:
    """Return the URL to which `qurl` should be redirected,
    or False if no redirect is to be performed.
    """
    url = qurl.url()

    if any(domain in url for domain in BREATHER):
        return QUrl("https://sverona.dev/breather/")

    return False


def intercept(req: interceptor.Request):
    if (req.resource_type != interceptor.ResourceType.main_frame or
            req.request_url.scheme() in {"data", "blob"}):
        return

    url = req.request_url

    redir = redirect_to(url)
    if redir:
        req.redirect(redir)


interceptor.register(intercept)
```

I have this in `~/.config/qutebrowser/pyconfig/block.py`.

May your mental health never falter.

