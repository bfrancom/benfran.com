---
title: It's 2019 and Your Taking an All Day Outage????!!!!
image: images/172.jpg
date: 2019-07-30 15:38:00.000000000 -06:00

---

I get a bit frustrated when I see messages from large corporations (like banks) state that their services or site will be unavailable for extended periods of time due to maintenance.

It's 2019 for heaven's sakes! If your vendor or internal architecture can't do zero-downtime-deploys, or keep systems online while patching happens...there is probably something very wrong. 

## Why does this happen?

Technical debt, usually. A solution, architecture or technology was easy at the time, and is now so entrenched in the enterprise, that you're stuck. This dependency has likely spidered through the enterprise, with so many other internal solutions dependent upon it, it can't easily be replaced...and will never be fully decommissioned.

What's the answer then?

## RIP THE BANDAID OFF!
I know, easy, right? Just replace it! 

Maybe it's easy, but probably not. There are a lot of things to consider, especially the top 2 OSI layers of politics and money — but the more you neglect it, the worse it will get!

So perhaps an overly simplistic calculation is:

`if downtime costs > replacement costs == REPLACE`

When you start calculating, be sure to factor in the following:
* Engineering time (lost)
* Operations time (lost)
* Planning/Testing time
* Customer satisfaction (or customers lost)
* Opportunity Costs
  * If you don't replace now, how many more outages impacting the things above will continue to happen.
  * All the other time you are wasting with all day outages that you are unable to focus on something better.

It may be hard to completely define both sides of the equation, but an educated assessment should be done.

## Replacements
When researching the replacement, be sure to look at best architectural practices, so you aren't put in this predicament again. This probably means things like:
* microservices (service oriented architecture)
* serverless
* cloud
* highly distributed/highly available architectures (and data stores).

## Moral of the Story
Besides, "don't do drugs," start thinking in terms that will minimize future technical debt as much as possible.
