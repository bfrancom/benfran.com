---
title: Get list of IAM users in an account
date: 2023-02-13 18:18
tags:
  - aws
  - cloud
  - cli
  - iam
  - architect
---

Quick one liner to get AWS users in an account:

`aws iam list-users --query 'Users[*].UserName'`