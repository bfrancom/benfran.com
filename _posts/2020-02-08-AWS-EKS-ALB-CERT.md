---
title: AWS EKS Kubernetes Fargate Ingress Controller ALB Certificate
image: images/188.jpg
exerpt: "Example of setting up certificate on AWS application load balancer for EKS/Fargate"
date: 2020-02-08T21:36:18-06:00
tags: [aws, kubernetes, aws, ecs, fargate]
categories: [aws, kubernetes, fargate, security]
---

Wow that title is a mouthful!

It took me a little time to figure out how to setup the certificate on EKS/Fargate in AWS. I was following [this](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html) tutorial from the docs. 

* Be sure to click the "Fargate" part of the tuorial half-way down the page to curl in the 2048-ingress.yaml below.

After delegating my subdomain to AWS, I then setup a cert in ACM, and modified the 2048-ingress.yaml as follows:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: "2048-ingress"
  namespace: "2048-game"
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    # Substitue your arn info below
    alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:us-east-1:XXXXXXXX:certificate/XXXXXXXX
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
    alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig": { "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'

  labels:
    app: 2048-ingress
spec:
  rules:
    - http:
        paths:
          - path: /*
            backend:
              serviceName: "service-2048"
              servicePort: 80
```

et voila:

![et voila](https://i.imgur.com/ZhopCTS.png)
