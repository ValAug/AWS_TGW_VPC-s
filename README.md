# AWS_TGW_VPC's
Creating a Transit gateway with a few VPC's attached to it.

<!-- retro visitor counter -->
<p align="center"> 
  <img src="https://profile-counter.glitch.me/ValAug/count.svg" />
</p>

# AWSSG_validation_with_Terraform

###### Cloud - :cloud:
![AWS](https://img.shields.io/badge/-AWS-000000?style=flat&logo=Amazon%20AWS&logoColor=FF9900)

###### IaaC
![Terraform](https://img.shields.io/badge/-Terraform-000000?style=flat&logo=Terraform)

# AWS SG and architecture diagram 
<!--[alt text](https://github.com/ValAug/AWS_TGW_VPC-s/blob/master/sg_diagrama.png)-->


# Purpose

Shows how to use AWS with Terraform to accomplish the following tasks:

* Build an AWS TGW 
* Build an AWS VPC
* Build an AWS Subnet
* Build an AWS Route table and route
* Attache VPC's to the TGW

# Prerequisites

* You must have an AWS account, and have your default credentials and AWS Region
  configured
* You must have Terraform installed


# Cautions

* As an AWS best practice, grant this code least privilege, or only the 
  permissions required to perform a task. For more information, see 
  [Grant Least Privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege) 
  in the *AWS Identity and Access Management 
  User Guide*.
* This code has been tested in us-west-1 AWS Regions only. However it should work in any other region. 
* Running this code might result in charges to your AWS account.

# How to run this code

- [How to run this code](#how-to-run-this-code)
  - [Quick Start](#quick-start)
  - [Quick Destroy](#quick-destroy)
  - [Notes](#notes)

## Quick Start

It will deploy to the account setup for the aws cli called 'default'

```bash
cd AWS_SG_validation_with_Terraform
terraform init
terraform validate
terraform apply --auto-approve
```

## Quick Destroy

```bash
terraform destroy --auto-approve
```

## Notes

- clone this Git repo
- cd to the the directory AWS_TGW_VPC-s
- use terraform __init__ command to initialize the Terraform working directory and to download plugins for a provider (aws)
- terraform validate command will validate the code before actual deployment
- terraform plan command will show the execution code before making the actual deployment
- terraform apply
- Alternate command : terraform apply -auto-approve
- terraform destroy
- Alternate command : terraform destroy -auto-approve
- terraform fmt -recursive # A way to format the terraform code
