---
title: Naming Confusion
date: 2023-02-03 18:18
tags:
  - aws
  - cloud
  - cdk
  - kubernetes
  - architect
  - serverless
---

If you've been in tech for more than a few minutes, you'll note that naming things is always a [challenge](https://www.martinfowler.com/bliki/TwoHardThings.html). Some that I've come across are:

* [Catalina](https://tomcat.apache.org/tomcat-7.0-doc/api/org/apache/catalina/startup/Catalina.html) and [Catalina](https://en.wikipedia.org/wiki/MacOS_Catalina)
* [Copilot](https://aws.amazon.com/containers/copilot/) and [Copilot](https://github.com/features/copilot)
* [main](https://github.com/github/renaming) vs [main](https://opensource.com/article/19/5/how-write-good-c-main-function) 
* [RDS](https://aws.amazon.com/rds/) and [RDS](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/welcome-to-rds)
* [scp](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) and [scp](https://en.wikipedia.org/wiki/Secure_copy_protocol)

So there is a need to get specific when you are writing or speaking. eg) "Apache Tomcat Catalina" vs "MacOS Catalina" or "Amazon RDS" vs "Microsoft RDS" and so forth. Sometimes you'll need to take it further and expand all the acronyms too. 

I've consistently mistaken that people just get context, assume and move on. Not so great for communicating. Ideally, I should state the specifics once at the beginning of a document or conversation, then reference by the more general name later on.

The one I just came across today was [cdk](https://aws.amazon.com/cdk/) and [cdk](https://canonical.com/blog/canonicals-distribution-of-kubernetes-supported-on-arm-architecture). Luckily (or Unluckily) not everyone is consistent with the latter. Not even Canonical in their own documentation. 