---
title: AWS Opensearch and EC2 Scripts
tags: [aws, technology, ec2, opensearch]
date: 2022-05-25 18:18:18
---

Been working on some AWS reports lately, some for EC2 and OpenSearch to help determine costs, and what it would take to migrate to Graviton instances.

OpenSearch
```bash
#!/bin/bash


#export AWS_PAGER="";
# for i in $(aws opensearch list-domain-names |jq -r '.DomainNames[].DomainName')
# do
# aws opensearch describe-domains --domain-name $i --query 'DomainStatusList[*].[EngineVersion,ClusterConfig.InstanceType,ClusterConfig.InstanceCount,EBSOptions.VolumeType,EBSOptions.VolumeSize]'
# done

export AWS_PAGER=""
for i in $(aws opensearch list-domain-names |jq -r '.DomainNames[].DomainName'|tr '\n' ' ')
do
    aws opensearch describe-domains --domain-name $i --query 'DomainStatusList[*].[DomainId,EngineVersion,ClusterConfig.InstanceType,ClusterConfig.InstanceCount,ClusterConfig.DedicatedMasterEnabled,ClusterConfig.DedicatedMasterType,ClusterConfig.DedicatedMasterCount,ClusterConfig.DedicatedMasterCount,EBSOptions.VolumeType,EBSOptions.VolumeSize]' |jq -r '.[] | @csv' >> /tmp/test.csv
done
```

EC2
```bash
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType'] |jq -r '.[][] | @csv' >>/tmp/ec2.csv
```
