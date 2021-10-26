# aws-sandbox-tf

- This module creates the AWS S3 bucket and AWS DynamoDB table needed to host remote state for other modules/configurations to use. 
- The state file for this config is stored locally.
- Dev uses ENV VARS for auth to AWS [1].
- The root module is the working directory where Terraform is invoked. In this module, terraform is invoke at the same level as `main.tf`

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
`dmc` <--- to open the AWS Console GUI
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

#### Tips
1. Use only one module per repository.
2. Track all changes with version control with detailed commit messages.
3. A common use case for conditionals is to enable/disable a resource by conditionally setting the count:
    ```
    resource "aws_instance" "vpn" {
    count = "${var.something ? 1 : 0}"
    }
    ```
    In the example above, the "vpn" resource will only be included if "var.something" evaluates to true. Otherwise, the VPN resource will not be created at all.
4. kjhkjh

#### Resources
[1] https://registry.terraform.io/providers/hashicorp/aws/latest/docs
