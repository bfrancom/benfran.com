---
title: Cross Account S3 Bucket Access
date: 2022-11-09 18:18:18 -06:00
tags:
  - aws
  - s3
  - IAM
  - technology
  - automation
---

I had a use case come up recently for cross account access to grant the user in one account (Account A) to a different account's (Account B) S3 bucket. The requirements were such that users from Account A could only upload (but not download) objects.  I hadn't done this before, and wanted to document my findings.

The fake account number referenced in this doc is `8675309` (because of Jenny). It's just made up. Replace with your real account number.


These are some AWS Knowledge Center articles that I found useful:
* [https://aws.amazon.com/premiumsupport/knowledge-center/s3-cross-account-upload-access/](https://aws.amazon.com/premiumsupport/knowledge-center/s3-cross-account-upload-access/)
* [https://aws.amazon.com/premiumsupport/knowledge-center/cross-account-access-s3/](https://aws.amazon.com/premiumsupport/knowledge-center/cross-account-access-s3/)


## Step 1 Prep Account B

What are we doing in this step? Creating a bucket in account B, with a reference to Account A's role (from step 2). Confused yet? I had to draw a diagram to get it straight in my head. Diagrams are wonderful.

Create an S3 bucket in account B called `account-b-bucket`, blocking all public access, with this bucket policy. You will need to come back after creating the role in step 2 to fill in the principal arn reference.  


```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::8675309:role/account-a-s3-role"
            },
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::account-b-bucket/foo*",
                "arn:aws:s3:::account-b-bucket/fighters*"
            ]
        }
    ]
}
```

## Step 2 Prep Account A

Create a user if you don't already have one. Below, I called my user `bobbytables`.  Save the key and secret into an `~/.aws/credentials` profile called `s3-test`. Then create a new IAM role with a custom [trust policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#term_trust-policy) policy, where that trust policy looks like the following JSON below.

Note: This is so the user in account A can assume the needed *ROLE* in account A. Name it "account-a-s3-role" as you will need it later.

```
{
    "Version": "2012-10-17",https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#term_trust-policy
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "s3.amazonaws.com",
                "AWS": "arn:aws:iam::8675309:user/bobbytables"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

Still in account A, Setup an inline IAM Policy in the ROLE you created in the last step. Note, the name of the bucket is the remote bucket from account B.

``` JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::account-b-bucket/foo/*",
                "arn:aws:s3:::account-b-bucket/fighters/*"
            ]
        }
    ]
}
```

## Step 3, Assume Role and Test. 

If using code, make sure that it is assuming the role (which generates separate, temporary creds): [https://docs.aws.amazon.com/IAM/latest/UserGuide/example_sts_AssumeRole_section.html](https://docs.aws.amazon.com/IAM/latest/UserGuide/example_sts_AssumeRole_section.html)

I used the aws client in my testing. Using your `bobbytable` user credentials, run the following: 

`aws sts assume-role --role-arn "arn:aws:iam::8675309:role/account-a-s3-role" --role-session-name BenAWSCLI-Session --profile s3-test`

This will output JSON whith a _separate_, temporary `AccessKeyId`, `SecretAccessKey`, and `SessionToken`. You'll need to export them to your environment respectively:

```
export AWS_ACCESS_KEY_ID=<AccessKeyId>
export AWS_SECRET_ACCESS_KEY=<SecretAccessKey>
export AWS_SESSION_TOKEN=<SessionToken>
```

Ensure you have the correct role assumed by using the aws client `aws sts get-caller-identity` then try uploading a file:
`aws s3 cp test.txt s3://account-b-bucket/foo/test.txt`

If it didn't work, note the error, and check the roles, policies and rights.