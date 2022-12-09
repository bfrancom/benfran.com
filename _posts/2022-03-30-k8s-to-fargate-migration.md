---
title: How I Migrated a Multi-Million $ Dollar Company from Kubernetes to AWS ECS Fargate
tags: [cloud, cloud architecture, AWS, kubernetes, k8s, information security, cybersecurity]
date: 2022-03-12 13:00:00
---

![Security](/images/simplicity/guy-walking.jpg  "Image courtesy of Unsplash: https://unsplash.com/photos/R9OueKOtGGU") 

## To Stay With K8S or Not? That is The Question

In 2019, I was doing some consulting. Part of the engagement was for a multimillion dollar company that was growing quickly with locations across the US. This company utilizes software to serve their various business processes and operations such as order entry order processing, sales, workflow management, metrics, document management, appointment/resource scheduling, and customer communication. 

In consulting with the CTO, I was tasked with planning the next phase of how their software applications would run on AWS. This was an interesting challenge due to a few reasons. 1) A great technical challenge, and 2) If we changed the platform stack, there would be implications on helping others understand the new processes.

The driving factors for the change was their existing server infrastructure was old, unmaintained, and unpatched. This meant there were security issues and a certain level of risk that needed to be addressed.

The existing setup was using Kubernetes, which historically worked pretty good for them, but not great. There were growing pains, and problems with self-managing the underlying infrastructure. The downside to running Kubernetes on your own (or self-managed), is all the underlying complexities to maintain, and this was problematic when it came to incident management. The existing workloads were running in AWS, but all being self-managed.

After careful consideration, and researching several options, I decided to utilize AWS Elastic Container Service (ECS) Fargate (I'll call it just 'Fargate' from here on out, knowing you can also run Fargate on EKS). To put this more simply, unlike running Kubernetes on your own, Fargate allows you to run your software applications easily without having to manage so much on your own. Instead, Amazon manages the server infrastructure for you under the hood.

Probably the biggest factor of not recommending Kubernetes is that maintaining infrastructure at a low level, which is not a core-competency of the firm, and it didn't make sense to maintain an overly complex system with ongoing significant operational costs with the requirements and use-cases the company had.

Why not stick with the status quo–Kubernetes and the self managed option?  Because of the ongoing security and maintenance concerns. I would need to setup multiple environments to test effectively, and to do that in Kubernetes, while maintaining parity between environments is a large operational burden. I estimated that to build what was needed, and to maintain Kubernetes at the level we were looking at would have costed double than what Fargate would in operational time, and at least the same amount lost in opportunity costs where I could be automating other things for the customer. Also, there would be ongoing maintenance that would be a significant burden.

I also considered a managed version of Kubernetes. AWS and other vendors provide a managed offering, which allows for more flexibility, but ECS Fargate provides powerful simplicity. The firm's software that needed to run didn't require much flexibility, so my recommendation to go with Fargate were warranted, and the tradeoffs were definitely worth it for this workload.

I build a Proof of Concept for Fargate in the Summer of 2019, and by that Fall, I had proven it out. The time in between was understanding how Fargate was implemented, how to get it automated, and how to integrate it with other existing services. I also migrated their CI/CD pipeline over to GitHub actions.  The initial lift and learning curve took some time, but after getting a working PoC, I was able to essentially copy and paste the configuration to enable the other needed environments, and put together a good plan in place to cut over to the new infrastructure.

The result of the migration was now there was very little underlying infrastructure to maintain, and ongoing operational costs were significantly lower. All they really worry about now is updating Docker images.  The CTO and I liked the setup so much, we started converting another large client of theirs. I followed up with the CTO in 2022 to see how things were going, and they have loved it. There is so little maintenance, and it has worked very well for them. I see them using it for at least 5 years, or until something even simpler comes along. This is one way how I have loved providing simple solutions to complex problems.


