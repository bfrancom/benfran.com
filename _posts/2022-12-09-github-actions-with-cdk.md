---
title: CDK Deployment with GitHub Actions
date: 2022-12-09 18:18
tags:
  - aws
  - cdk
  - github actions
  - github
  - git
  - technology
  - automation
  - ci/cd
  - pipelines
  - codebuild
  - codepipeline
---

I've been diving deep into AWS CDK recently, and started with [https://cdkworkshop.com/](https://cdkworkshop.com/)

This is a good way to get your feet wet. I wanted to see how to manage the deployment with GitHub actions. Ended up with this:


```
on: [push, workflow_dispatch]
jobs:
  aws_cdk:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3
      - uses: actions/setup-node@v2
        with:
          node-version: "14"
      - name: Configure aws credentials
        uses: aws-actions/configure-aws-credentials@master
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: 'us-west-2'
      - name: Install dependencies
        run: yarn
      - name: Synth stack
        run: yarn cdk synth
      - name: Deploy stack
        run: yarn cdk deploy --all --require-approval never
```

    Also, if you want to use GitHub for your code repo (instead of CodeCommit), but have CodeBuild watch for GitHub repo changes and do the deploy, this example below worked. You'll need to setup in GitHub a personal access token (PAT), followed by adding that token in AWS SecretsManager as it is called below `github-token-secret`.

```
    export class WorkshopPipelineStack extends cdk.Stack {
    constructor(scope: Construct, id: string, props?: cdk.StackProps) {
        super(scope, id, props);

        // Set your Github username and repository name
        const branch = 'main';
        const repo = 'ben-francom/ben-francom-cdk-pipeline-test';

        // The basic pipeline declaration. This sets the initial structure
        // of our pipeline
        const pipeline = new CodePipeline(this, 'Pipeline', {
            pipelineName: 'WorkshopPipeline',
            synth: new CodeBuildStep('SynthStep', {
                //call github to get code
                input: CodePipelineSource.gitHub(repo, branch, {
                    //generate a PAT in GitHub with correct rights and add the secret in secrets manager
                    authentication: cdk.SecretValue.secretsManager('github-token-secret')
                }),
                installCommands: [
                    'npm install -g aws-cdk'
                ],
                commands: [
                    'npm ci',
                    'npm run build',
                    'npx cdk synth'
                ]
            }
            )
        });
```