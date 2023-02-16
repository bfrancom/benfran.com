---
title: Integrating Artifactory and Tests with CDK Pipelines
date: 2023-02-16 08:18
tags:
  - aws
  - cloud
  - cdk
  - artifactory
  - architect
---

Building further upon my ["Deploy a container to AWS in 5 lines of code"](/cdk-app-runner/) post, I wanted to add artifactory and a post-deployment test. 

It took me some time to figure out how to get the artifactory token to be read in the build environment.

{% gist 674dd0cdad8b912e9730d4462cb13103 %} 