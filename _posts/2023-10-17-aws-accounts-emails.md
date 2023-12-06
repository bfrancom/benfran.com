---
title: How to handle hundreds of AWS account EMAILs and maybe more on the cheap
tags: [aws, email, domain, accounts, account factory, control tower]
date: 2023-10-17 18:18:18
---

## Why is this needed?
There needs to be an easy-button for dealing with hundreds of emails for root access to AWS accounts. These emails are used for:

* To login as root and make changes to the account (like adding MFA)
* To get notifications of changes to services
* To delete the account
* Other things

*Note: To create the AWS accounts themselves easily, consider [AWS Control Tower Account Factory for Terraform (AFT)](https://docs.aws.amazon.com/controltower/latest/userguide/taf-account-provisioning.html). This is beyond the scope of what we're looking at is just the email portion.

## Solution
Set up a separate domain with a catchall address to forward emails to your real domain (or distribution list). I set up all my domains and
1. Set up a domain (or subdomain to an existing domain). I was advised that emails coming from subdomains such as `yourmom@aws.cloud.benfran.com` may be considered more spammy, but I haven't tested that theory (YMMV).
    * The domain used for AWS account facotry emails don not have to be anything related to your exchange environment, or existing domains (if you do't want) since it is only used to forward emails and that's pretty much it
    * An example might be `cloud-bfran.com` or `bears-beets-battlestargalactica.com` ...really just anything will do
2. Forward all emails from anything at said domain to a real email account or distribution list
    * This is how it looks in CloudFlare

      ![CloudFlare](https://i.imgur.com/7AHnKHk.png)
3. Splitting out prod from non-prod to minimize noise
    * You may not care so much about maintenance events happening in non-production accounts, but consider this carefully as these accounts are likely production to someone!
    * You could set prod accounts to something like `aws-prod@cloud-bfran.com` and non-prod to `non-prod@cloud-bfran.com`
As a bonus, you can do something similar to a personal domain so any emails going there can be forwarded to a specific address or distribution list. This is helpful to see who may be spamming you, or to have some specific rules in place to deal with lot's o' mail.