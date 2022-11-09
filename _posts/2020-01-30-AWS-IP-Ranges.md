---
title: AWS IP Range Automation
image: images/186.jpg
date: 2020-01-30 20:38:00.000000000 -06:00
tags:
  - aws
  - technology
  - automation
---

AWS provides a list of their IP ranges for you to use when configuring whitelists, firewalls, and other things. The list is available in JSON from: 

https://ip-ranges.amazonaws.com/ip-ranges.json

To get it automated into your pipelines, or scripts, you can use `curl` and `jq` in this manner:

`curl https://ip-ranges.amazonaws.com/ip-ranges.json | jq .`

This will give you all the IP's, regions, and info.

To get more specific like the us-east-1 region and the AMAZON service, just add some more filters:

`curl https://ip-ranges.amazonaws.com/ip-ranges.json | jq '.prefixes[] | select(.region == "us-east-1") | select(.service == "AMAZON")'`
