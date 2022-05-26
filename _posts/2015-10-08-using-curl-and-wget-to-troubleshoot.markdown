---
title: Using curl and wget with Headers to Troubleshoot a Rest Endpoint
image: images/149.jpg
date: 2015-10-08 15:33:52.000000000 -06:00
---
Had some fun today trying to reproduce an application error request to a rest endpoint with cli tools.

##wget
`wget -v --header "Accept: application/json" --header "Accept-encoding: gzip" https://www.endpoint.com`

##curl
`curl -v -H "Accept:application/json" -H "Accept-encoding:gzip" -H https://www.endpoint.com`
