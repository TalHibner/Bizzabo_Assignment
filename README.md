# Bizzabo_Assignment

Write using any IAC engine (Terraform is preferred but CloudFormation/Ansible are also ok) to
create the below AWS components:
● VPC with two public and private subnets
● Route tables for each subnet
● Security Group to allow port 80 and 443 from the Internet
● ELB - listening on ports 80 & 443
● Public route53 hosted zone and CNAME entry for the ELB

## Usage

To run this you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.20 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.20 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | terraform-aws-modules/acm/aws | ~> 2.0 |
| <a name="module_ec2_instances"></a> [ec2\_instances](#module\_ec2\_instances) | terraform-aws-modules/ec2-instance/aws | ~> 2.0 |
| <a name="module_elb"></a> [elb](#module\_elb) | ../../ |  |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_elb_service_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet_ids.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | Number of instances to create and attach to ELB | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_elb_dns_name"></a> [this\_elb\_dns\_name](#output\_this\_elb\_dns\_name) | The DNS name of the ELB |
| <a name="output_this_elb_id"></a> [this\_elb\_id](#output\_this\_elb\_id) | The name of the ELB |
| <a name="output_this_elb_instances"></a> [this\_elb\_instances](#output\_this\_elb\_instances) | The list of instances in the ELB (if may be outdated, because instances are attached using elb\_attachment resource) |
| <a name="output_this_elb_name"></a> [this\_elb\_name](#output\_this\_elb\_name) | The name of the ELB |
| <a name="output_this_elb_source_security_group_id"></a> [this\_elb\_source\_security\_group\_id](#output\_this\_elb\_source\_security\_group\_id) | The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances |
| <a name="output_this_elb_zone_id"></a> [this\_elb\_zone\_id](#output\_this\_elb\_zone\_id) | The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
