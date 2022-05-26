---
title: How I Migrated a Multi-Million $ Dollar Company from Kubernetes to AWS ECS Fargate
tags: [cloud, cloud architecture, AWS, information security, cybersecurity]
date: 2022-03-12 13:00:00
---

![Security](/images/simplicity/guy-walking.jpg  "Image courtesy of Unsplash: https://unsplash.com/photos/R9OueKOtGGU") 

## To Stay With K8S or Not? That is The Question

In 2019, I was doing some consulting. Part of the engagement was for a multimillion dollar company that was growing quickly with locations across the US. This company utilizes software to serve their various business processes and operations such as order entry order processing, sales, workflow management, metrics, document management, appointment/resource scheduling, and customer communication. 

In consulting with the CTO, I was tasked with planning the next phase of how their software applications would run on Amazon's Cloud Computing Services, also known as Amazon Web Services, or AWS. The problems and driving factors for the change was their existing server infrastructure was old, unmaintained, and unpatched. This meant there were security issues and a certain level of risk that needed to be addressed.

The existing setup was using a platform called Kubernetes, which essentially provides a way to orchestrate (or help automate) the underlying server infrastructure. The downside to running Kubernetes on your own (or self-managed), is all the underlying pieces to maintain and it is a very complex system. It was running in AWS, but not an effective implementation due to the reasons discussed here.

Probably the biggest factor of not recommending Kubernetes is that maintaining infrastructure at a low level, is not a core-competency of the firm, and it didn't make sense to maintain an overly complex system with ongoing operational costs with the requirements and use-cases the company had.

After careful consideration, and researching several options, I decided to utilize AWS Elastic Container Service (ECS) Fargate (I'll call it just 'Fargate' from here on out, knowing you can also run Fargate on EKS). To put this more simply, unlike running Kubernetes on your own, Fargate allows you to run your software applications easily without having to manage so much on your own. Instead, Amazon manages the server infrastructure for you under the hood.

Why not stick with the status quo–Kubernetes and the self managed option?  Because of the ongoing maintenance concerns. I would need to setup multiple environments to test effectively, and to do that in Kubernetes, while maintaining parity between environments is a large operational burden. I estimated that to build what was needed, and to maintain Kubernetes at the level we were looking at would have costed $20k more than Fargate in operational time, and at least the same amount lost in opportunity costs where I could be automating other things for the customer. Also, there would be ongoing maintenance that would be factored in at $5k/year.

I also considered a managed version of Kubernetes. AWS and other vendors provide a managed offering, which allows for more flexibility, but ECS Fargate provides powerful simplicity. The software that needed to run didn't require much flexibility, so my recommendation to go with Fargate were warranted, and the tradeoffs were definitely worth it for this workload.

I build a Proof of Concept for Fargate in the Summer of 2019, and by that Fall, I had proven it out. The time in between was understanding how Fargate was implemented, how to get it automated, and how to integrate it with other existing services. These other services included things like software builds, tests, and deployments. The initial lift and learning curve took some time, but after getting a working PoC, I was able to essentially copy and paste the configuration to enable the other needed environments, and put together a good plan in place to cut over to the new infrastructure.

The result of the migration was now there was very little underlying infrastructure to maintain, and ongoing operational costs were lowered by 50%. All they really worry about now is updating Docker images.  The CTO and I liked the setup so much, we started converting another large client of theirs. I followed up with the CTO in 2022 to see how things were going, and they have loved it. There is so little maintenance, and it has worked very well for them. I see them using it for at least 5 years. I love providing simple solutions to complex problems.


