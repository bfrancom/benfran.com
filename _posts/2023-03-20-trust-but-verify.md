---
title: Trust but Verify your Endpoints
date: 2023-03-20 18:18
tags:
  - aws
  - cloud
  - network
  - diagram
  - architect
---

What people believe vs reality is a lot of times different. Take for example your application architecture. What was documented in the past may not be a true reflection of the present.

How to address this problem? Two things I like to use are:

  1) Shell into a pod if you are running k8s (or ssh into a vm/physical box), and look at your runtime environment variables
  2) Use network tools like a packet trace to see where connections really are.
  
  Trust #2 more than #1 since "packets don't lie."