---
title: Rightsizing AWS OpenSearch
date: 2023-01-26 18:18
tags:
  - aws
  - opensearch
  - elasticsearch
  - cloud
  - architect
---

Rightsizing AWS OpenSearch. This was a recent task of mine that came up to help one of our engineering teams. The problem with rightsizing effectively is that it's more of an art than a science because requirements are so vastly different. There isn't a one-size-fits-all approach.

What I've learned is, try your best to get a good estimate, roll it out, then monitor the heck out of it.  If monitoring proves something different, then adjust as needed. Amazon has [recommended best practices documentation](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/bp.html) on [sizing](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/sizing-domains.html) and [monitoring](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cloudwatch-alarms.html).

Aside from the docs/links above, I also found these videos helpful:
* https://www.youtube.com/watch?v=SOTFnRezIH0
* https://www.youtube.com/watch?v=JmDGhqWBy8Q

Thanks [@_searchgeek](https://aws.amazon.com/blogs/database/author/handler/)!
