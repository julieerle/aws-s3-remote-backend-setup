# aws-sandbox-tf
Playing around with local state and using ENV VARS for auth to AWS [1].

```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
$ terraform plan
```

## State file location
local machine

## Workflow
`dmr`
`dma`
`terraform init`
`terraform fmt`
`terraform plan`
`terraform apply`

## File structure

aws-sandbox-tf
├── README.md
├── main.tf
├── outputs.tf
├── provider.tf
└── variables.tf

## Naming Convention

| terraform	| cloud | provider	function	| full name
|--------|--------|--------|--------|
|terraform	| aws	| consul cluster	| terraform-aws-consul_cluster
|terraform	| aws	| security module	| terraform-aws-security
|terraform	| azure	| database	| terraform-azure-database

###### Tips
1. Use only one module per repository.
2. Track all changes with version control with detailed commit messages.

###### Resources
[1] https://registry.terraform.io/providers/hashicorp/aws/latest/docs
