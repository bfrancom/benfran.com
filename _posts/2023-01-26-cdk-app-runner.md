---
title: Deploy a container to AWS in 5 lines of code
date: 2023-01-26 17:00
header:
  image: /assets/images/laptop.jpg
  caption: "Photo credit: [**Unsplash**](https://unsplash.com)"
tags:
  - software
  - IaC
  - aws
  - cdk
---

How easy is it to deploy your code to AWS? It's as simple as 5 lines of code to have a completely hosted publicly available website. 

For those that want to get down to the nitty-gritty quickly, the code is all available in [GitHub](https://github.com/bfrancom/cdk-app-runner).

I wanted to see how [CDK](https://aws.amazon.com/cdk/) would handle deploying an [AppRunner](https://aws.amazon.com/apprunner/) website, and it turns out, it's easy as pie 🥧🍕.

Make sure you have cdk installed locally: `npm install -g aws-cdk` then run the following:

`mkdir cdk-app-runner && cd cdk-app-runner && cdk init --language typescript`

Then edit `lib/cdk-app-runner-stack.ts` and add the following:

Import code
```
import * as apprunner from '@aws-cdk/aws-apprunner-alpha';
```

Drop this under `//The code that defines your stack goes here`
```
   const service = new apprunner.Service(this, 'Service', {
      source: apprunner.Source.fromEcrPublic({
        imageConfiguration: { port: 8000 },
        imageIdentifier: 'public.ecr.aws/aws-containers/hello-app-runner:latest',
      }),
    });
```

This code pulls a hello world app from ECR public. I guess it's technically 7 lines of code with the import, but that's mainly for readability. Ok, 8 if you include the bash commands, but that's a bit pedantic, wouldn't you say?

Now run the following in your terminal:
* `npm i @aws-cdk/aws-apprunner-alpha` 
* `cdk bootstrap` to bootstrap your AWS account with needed CDK resources
* `cdk diff` to see the diff between local vs remote.
* If all looks good, run `cdk deploy` and you are done!

But wait, I also want to know the AppRunner URL after it deploys. I know it is severely painful to go hunt through the AWS console to find it.

Have no fear, just a few more lines of code. Append this under your other code:

```
    new cdk.CfnOutput(this, 'apprunner-url', {
      value: service.serviceUrl,
      description: 'App Runner URL',
      exportName: 'apprunner-url',
    });
```
It will spit the URL out in your terminal after you run `cdk diff` and `cdk deploy` again.

```
CdkAppRunnerStack: creating CloudFormation changeset...

 ✅  CdkAppRunnerStack

✨  Deployment time: 22.26s

Outputs:
CdkAppRunnerStack.apprunnerurl = vsdncfcxyz.us-east-1.awsapprunner.com
Stack ARN:
arn:aws:cloudformation:us-east-1:8675309:stack/CdkAppRunnerStack/7f2d5a70-9dcb-11ed-a83d-122e155993f5
```

Take that [Kubernetes](https://world.hey.com/dhh/they-re-rebuilding-the-death-star-of-complexity-4fb5d08d)!!!

To clean up everything, run `cdk destroy` and you're done.

Here is another resource for doing something similar:
[https://aws.amazon.com/getting-started/guides/deploy-webapp-apprunner/module-one/](https://aws.amazon.com/getting-started/guides/deploy-webapp-apprunner/module-one/)
