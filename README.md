# Bizzabo_Assignment

##  Part2 - AWS API
A single-file that shows the whole inventory of your AWS services on a single page.  
https://github.com/devops-israel/aws-inventory  
The AWS Inventory is using the AWS JavaScript SDK and a sprinkle of Bootstrap, this allows to show results in pretty tables from any AWS API.  
As requested in the assignment, with only giving your access and secret key to your account(locally):
- You get a web-ui with a list of all AWS services being used region wise
- When clicking each region you get a list for each service in detail, like EC2, RDS etc. When you click on it you get a table with all details
- You can also download the service table content to a tsv file!  

### Usage

- Clone or copy the index.html file to your computer
- Open the index.html file in your browser (you can find it in this GitHub repository)
- In the top, write your access and secret key, and click the "confirm" button.

### Tests
You can find in the current Github repository the "tests-part2" directory. 
when you'll open it you'll find the output of running manually using the AWS CLI 
https://awscli.amazonaws.com/v2/documentation/api/latest/reference/resourcegroupstaggingapi/get-resources.html.  
In addition, you'll find some print screens of the resources in the AWS Console.

## Part1 - AWS Infrastructure as Code

I chose to write with Terraform as an IaC engine, to
create the below AWS components:  
● VPC with three public and private subnets (instead of 2 for HA)  
● Route tables for each subnet  
● Security Group to allow port 80 and 443 from the Internet  
● ELB - listening on ports 80 & 443  
● Public route53 hosted zone and CNAME entry for the ELB  

*Note about CNAME:*  
AWS recommends creating an ‘Alias’ record that maps to your ELB, instead of using CNAMEs. 
Alias records have two advantages: first, unlike CNAMEs, you can create an Alias record for your zone apex (e.g. example.com, instead of www.example.com), and second, queries to Alias records are free of charge.

*Note about SSL:*  
For using ELB with port 443 https, Valid SSL certificate has to be specified as ssl_certificate_id argument for secure listener. 
Use terraform-aws-acm module to create one and later to validate.

*Limitation:*  
You need to have a domain name or register a new domain name for Route53 hosted zone!
https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar.html  
https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html  

### Usage

To run this you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Tests
You can find in the current Github repository the "tests-part2" directory. 
when you'll open it you'll find the output of running "plan", "apply" and "destroy".
In addition, you'll find some print screens of the resources being provisioned in the AWS Console.

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.20 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.20 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| vpc | terraform-aws-modules/vpc/aws | ~> 2.0 |
| security-group | terraform-aws-modules/security-group/aws | ~> 2.0 |
| elb | terraform-aws-modules/elb/aws | ~> 2.0 |
| acm | terraform-aws-modules/acm/aws | ~> 2.0 |
| zones | terraform-aws-modules/route53/aws//modules/zones | ~> 2.0 |
| records | terraform-aws-modules/route53/aws//modules/records | ~> 2.0 |


### Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_elb_dns_name"></a> [this\_elb\_dns\_name](#output\_this\_elb\_dns\_name) | The DNS name of the ELB |
| <a name="output_this_elb_id"></a> [this\_elb\_id](#output\_this\_elb\_id) | The name of the ELB |
| <a name="output_this_elb_instances"></a> [this\_elb\_instances](#output\_this\_elb\_instances) | The list of instances in the ELB (if may be outdated, because instances are attached using elb\_attachment resource) |
| <a name="output_this_elb_name"></a> [this\_elb\_name](#output\_this\_elb\_name) | The name of the ELB |
| <a name="output_this_elb_source_security_group_id"></a> [this\_elb\_source\_security\_group\_id](#output\_this\_elb\_source\_security\_group\_id) | The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances |
| <a name="output_this_elb_zone_id"></a> [this\_elb\_zone\_id](#output\_this\_elb\_zone\_id) | The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record) |
| <a name="output_azs"></a> [azs](#output\_azs) | A list of availability zones specified as argument to this module |
| <a name="output_cgw_arns"></a> [cgw\_arns](#output\_cgw\_arns) | List of ARNs of Customer Gateway |
| <a name="output_cgw_ids"></a> [cgw\_ids](#output\_cgw\_ids) | List of IDs of Customer Gateway |
| <a name="output_database_internet_gateway_route_id"></a> [database\_internet\_gateway\_route\_id](#output\_database\_internet\_gateway\_route\_id) | ID of the database internet gateway route. |
| <a name="output_database_ipv6_egress_route_id"></a> [database\_ipv6\_egress\_route\_id](#output\_database\_ipv6\_egress\_route\_id) | ID of the database IPv6 egress route. |
| <a name="output_database_nat_gateway_route_ids"></a> [database\_nat\_gateway\_route\_ids](#output\_database\_nat\_gateway\_route\_ids) | List of IDs of the database nat gateway route. |
| <a name="output_database_network_acl_arn"></a> [database\_network\_acl\_arn](#output\_database\_network\_acl\_arn) | ARN of the database network ACL |
| <a name="output_database_network_acl_id"></a> [database\_network\_acl\_id](#output\_database\_network\_acl\_id) | ID of the database network ACL |
| <a name="output_database_route_table_association_ids"></a> [database\_route\_table\_association\_ids](#output\_database\_route\_table\_association\_ids) | List of IDs of the database route table association |
| <a name="output_database_route_table_ids"></a> [database\_route\_table\_ids](#output\_database\_route\_table\_ids) | List of IDs of database route tables |
| <a name="output_database_subnet_arns"></a> [database\_subnet\_arns](#output\_database\_subnet\_arns) | List of ARNs of database subnets |
| <a name="output_database_subnet_group"></a> [database\_subnet\_group](#output\_database\_subnet\_group) | ID of database subnet group |
| <a name="output_database_subnet_group_name"></a> [database\_subnet\_group\_name](#output\_database\_subnet\_group\_name) | Name of database subnet group |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of database subnets |
| <a name="output_database_subnets_cidr_blocks"></a> [database\_subnets\_cidr\_blocks](#output\_database\_subnets\_cidr\_blocks) | List of cidr\_blocks of database subnets |
| <a name="output_database_subnets_ipv6_cidr_blocks"></a> [database\_subnets\_ipv6\_cidr\_blocks](#output\_database\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of database subnets in an IPv6 enabled VPC |
| <a name="output_default_network_acl_id"></a> [default\_network\_acl\_id](#output\_default\_network\_acl\_id) | The ID of the default network ACL |
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | The ID of the default route table |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of the security group created by default on VPC creation |
| <a name="output_default_vpc_arn"></a> [default\_vpc\_arn](#output\_default\_vpc\_arn) | The ARN of the Default VPC |
| <a name="output_default_vpc_cidr_block"></a> [default\_vpc\_cidr\_block](#output\_default\_vpc\_cidr\_block) | The CIDR block of the Default VPC |
| <a name="output_default_vpc_default_network_acl_id"></a> [default\_vpc\_default\_network\_acl\_id](#output\_default\_vpc\_default\_network\_acl\_id) | The ID of the default network ACL of the Default VPC |
| <a name="output_default_vpc_default_route_table_id"></a> [default\_vpc\_default\_route\_table\_id](#output\_default\_vpc\_default\_route\_table\_id) | The ID of the default route table of the Default VPC |
| <a name="output_default_vpc_default_security_group_id"></a> [default\_vpc\_default\_security\_group\_id](#output\_default\_vpc\_default\_security\_group\_id) | The ID of the security group created by default on Default VPC creation |
| <a name="output_default_vpc_enable_dns_hostnames"></a> [default\_vpc\_enable\_dns\_hostnames](#output\_default\_vpc\_enable\_dns\_hostnames) | Whether or not the Default VPC has DNS hostname support |
| <a name="output_default_vpc_enable_dns_support"></a> [default\_vpc\_enable\_dns\_support](#output\_default\_vpc\_enable\_dns\_support) | Whether or not the Default VPC has DNS support |
| <a name="output_default_vpc_id"></a> [default\_vpc\_id](#output\_default\_vpc\_id) | The ID of the Default VPC |
| <a name="output_default_vpc_instance_tenancy"></a> [default\_vpc\_instance\_tenancy](#output\_default\_vpc\_instance\_tenancy) | Tenancy of instances spin up within Default VPC |
| <a name="output_default_vpc_main_route_table_id"></a> [default\_vpc\_main\_route\_table\_id](#output\_default\_vpc\_main\_route\_table\_id) | The ID of the main route table associated with the Default VPC |
| <a name="output_egress_only_internet_gateway_id"></a> [egress\_only\_internet\_gateway\_id](#output\_egress\_only\_internet\_gateway\_id) | The ID of the egress only Internet Gateway |
| <a name="output_elasticache_network_acl_arn"></a> [elasticache\_network\_acl\_arn](#output\_elasticache\_network\_acl\_arn) | ARN of the elasticache network ACL |
| <a name="output_elasticache_network_acl_id"></a> [elasticache\_network\_acl\_id](#output\_elasticache\_network\_acl\_id) | ID of the elasticache network ACL |
| <a name="output_elasticache_route_table_association_ids"></a> [elasticache\_route\_table\_association\_ids](#output\_elasticache\_route\_table\_association\_ids) | List of IDs of the elasticache route table association |
| <a name="output_elasticache_route_table_ids"></a> [elasticache\_route\_table\_ids](#output\_elasticache\_route\_table\_ids) | List of IDs of elasticache route tables |
| <a name="output_elasticache_subnet_arns"></a> [elasticache\_subnet\_arns](#output\_elasticache\_subnet\_arns) | List of ARNs of elasticache subnets |
| <a name="output_elasticache_subnet_group"></a> [elasticache\_subnet\_group](#output\_elasticache\_subnet\_group) | ID of elasticache subnet group |
| <a name="output_elasticache_subnet_group_name"></a> [elasticache\_subnet\_group\_name](#output\_elasticache\_subnet\_group\_name) | Name of elasticache subnet group |
| <a name="output_elasticache_subnets"></a> [elasticache\_subnets](#output\_elasticache\_subnets) | List of IDs of elasticache subnets |
| <a name="output_elasticache_subnets_cidr_blocks"></a> [elasticache\_subnets\_cidr\_blocks](#output\_elasticache\_subnets\_cidr\_blocks) | List of cidr\_blocks of elasticache subnets |
| <a name="output_elasticache_subnets_ipv6_cidr_blocks"></a> [elasticache\_subnets\_ipv6\_cidr\_blocks](#output\_elasticache\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of elasticache subnets in an IPv6 enabled VPC |
| <a name="output_igw_arn"></a> [igw\_arn](#output\_igw\_arn) | The ARN of the Internet Gateway |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The ID of the Internet Gateway |
| <a name="output_intra_network_acl_arn"></a> [intra\_network\_acl\_arn](#output\_intra\_network\_acl\_arn) | ARN of the intra network ACL |
| <a name="output_intra_network_acl_id"></a> [intra\_network\_acl\_id](#output\_intra\_network\_acl\_id) | ID of the intra network ACL |
| <a name="output_intra_route_table_association_ids"></a> [intra\_route\_table\_association\_ids](#output\_intra\_route\_table\_association\_ids) | List of IDs of the intra route table association |
| <a name="output_intra_route_table_ids"></a> [intra\_route\_table\_ids](#output\_intra\_route\_table\_ids) | List of IDs of intra route tables |
| <a name="output_intra_subnet_arns"></a> [intra\_subnet\_arns](#output\_intra\_subnet\_arns) | List of ARNs of intra subnets |
| <a name="output_intra_subnets"></a> [intra\_subnets](#output\_intra\_subnets) | List of IDs of intra subnets |
| <a name="output_intra_subnets_cidr_blocks"></a> [intra\_subnets\_cidr\_blocks](#output\_intra\_subnets\_cidr\_blocks) | List of cidr\_blocks of intra subnets |
| <a name="output_intra_subnets_ipv6_cidr_blocks"></a> [intra\_subnets\_ipv6\_cidr\_blocks](#output\_intra\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of intra subnets in an IPv6 enabled VPC |
| <a name="output_name"></a> [name](#output\_name) | The name of the VPC specified as argument to this module |
| <a name="output_nat_ids"></a> [nat\_ids](#output\_nat\_ids) | List of allocation ID of Elastic IPs created for AWS NAT Gateway |
| <a name="output_nat_public_ips"></a> [nat\_public\_ips](#output\_nat\_public\_ips) | List of public Elastic IPs created for AWS NAT Gateway |
| <a name="output_natgw_ids"></a> [natgw\_ids](#output\_natgw\_ids) | List of NAT Gateway IDs |
| <a name="output_outpost_network_acl_arn"></a> [outpost\_network\_acl\_arn](#output\_outpost\_network\_acl\_arn) | ARN of the outpost network ACL |
| <a name="output_outpost_network_acl_id"></a> [outpost\_network\_acl\_id](#output\_outpost\_network\_acl\_id) | ID of the outpost network ACL |
| <a name="output_outpost_subnet_arns"></a> [outpost\_subnet\_arns](#output\_outpost\_subnet\_arns) | List of ARNs of outpost subnets |
| <a name="output_outpost_subnets"></a> [outpost\_subnets](#output\_outpost\_subnets) | List of IDs of outpost subnets |
| <a name="output_outpost_subnets_cidr_blocks"></a> [outpost\_subnets\_cidr\_blocks](#output\_outpost\_subnets\_cidr\_blocks) | List of cidr\_blocks of outpost subnets |
| <a name="output_outpost_subnets_ipv6_cidr_blocks"></a> [outpost\_subnets\_ipv6\_cidr\_blocks](#output\_outpost\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of outpost subnets in an IPv6 enabled VPC |
| <a name="output_private_ipv6_egress_route_ids"></a> [private\_ipv6\_egress\_route\_ids](#output\_private\_ipv6\_egress\_route\_ids) | List of IDs of the ipv6 egress route. |
| <a name="output_private_nat_gateway_route_ids"></a> [private\_nat\_gateway\_route\_ids](#output\_private\_nat\_gateway\_route\_ids) | List of IDs of the private nat gateway route. |
| <a name="output_private_network_acl_arn"></a> [private\_network\_acl\_arn](#output\_private\_network\_acl\_arn) | ARN of the private network ACL |
| <a name="output_private_network_acl_id"></a> [private\_network\_acl\_id](#output\_private\_network\_acl\_id) | ID of the private network ACL |
| <a name="output_private_route_table_association_ids"></a> [private\_route\_table\_association\_ids](#output\_private\_route\_table\_association\_ids) | List of IDs of the private route table association |
| <a name="output_private_route_table_ids"></a> [private\_route\_table\_ids](#output\_private\_route\_table\_ids) | List of IDs of private route tables |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_private_subnets_ipv6_cidr_blocks"></a> [private\_subnets\_ipv6\_cidr\_blocks](#output\_private\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of private subnets in an IPv6 enabled VPC |
| <a name="output_public_internet_gateway_ipv6_route_id"></a> [public\_internet\_gateway\_ipv6\_route\_id](#output\_public\_internet\_gateway\_ipv6\_route\_id) | ID of the IPv6 internet gateway route. |
| <a name="output_public_internet_gateway_route_id"></a> [public\_internet\_gateway\_route\_id](#output\_public\_internet\_gateway\_route\_id) | ID of the internet gateway route. |
| <a name="output_public_network_acl_arn"></a> [public\_network\_acl\_arn](#output\_public\_network\_acl\_arn) | ARN of the public network ACL |
| <a name="output_public_network_acl_id"></a> [public\_network\_acl\_id](#output\_public\_network\_acl\_id) | ID of the public network ACL |
| <a name="output_public_route_table_association_ids"></a> [public\_route\_table\_association\_ids](#output\_public\_route\_table\_association\_ids) | List of IDs of the public route table association |
| <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids) | List of IDs of public route tables |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | List of ARNs of public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | List of cidr\_blocks of public subnets |
| <a name="output_public_subnets_ipv6_cidr_blocks"></a> [public\_subnets\_ipv6\_cidr\_blocks](#output\_public\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of public subnets in an IPv6 enabled VPC |
| <a name="output_redshift_network_acl_arn"></a> [redshift\_network\_acl\_arn](#output\_redshift\_network\_acl\_arn) | ARN of the redshift network ACL |
| <a name="output_redshift_network_acl_id"></a> [redshift\_network\_acl\_id](#output\_redshift\_network\_acl\_id) | ID of the redshift network ACL |
| <a name="output_redshift_public_route_table_association_ids"></a> [redshift\_public\_route\_table\_association\_ids](#output\_redshift\_public\_route\_table\_association\_ids) | List of IDs of the public redshidt route table association |
| <a name="output_redshift_route_table_association_ids"></a> [redshift\_route\_table\_association\_ids](#output\_redshift\_route\_table\_association\_ids) | List of IDs of the redshift route table association |
| <a name="output_redshift_route_table_ids"></a> [redshift\_route\_table\_ids](#output\_redshift\_route\_table\_ids) | List of IDs of redshift route tables |
| <a name="output_redshift_subnet_arns"></a> [redshift\_subnet\_arns](#output\_redshift\_subnet\_arns) | List of ARNs of redshift subnets |
| <a name="output_redshift_subnet_group"></a> [redshift\_subnet\_group](#output\_redshift\_subnet\_group) | ID of redshift subnet group |
| <a name="output_redshift_subnets"></a> [redshift\_subnets](#output\_redshift\_subnets) | List of IDs of redshift subnets |
| <a name="output_redshift_subnets_cidr_blocks"></a> [redshift\_subnets\_cidr\_blocks](#output\_redshift\_subnets\_cidr\_blocks) | List of cidr\_blocks of redshift subnets |
| <a name="output_redshift_subnets_ipv6_cidr_blocks"></a> [redshift\_subnets\_ipv6\_cidr\_blocks](#output\_redshift\_subnets\_ipv6\_cidr\_blocks) | List of IPv6 cidr\_blocks of redshift subnets in an IPv6 enabled VPC |
| <a name="output_this_customer_gateway"></a> [this\_customer\_gateway](#output\_this\_customer\_gateway) | Map of Customer Gateway attributes |
| <a name="output_vgw_arn"></a> [vgw\_arn](#output\_vgw\_arn) | The ARN of the VPN Gateway |
| <a name="output_vgw_id"></a> [vgw\_id](#output\_vgw\_id) | The ID of the VPN Gateway |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_enable_dns_hostnames"></a> [vpc\_enable\_dns\_hostnames](#output\_vpc\_enable\_dns\_hostnames) | Whether or not the VPC has DNS hostname support |
| <a name="output_vpc_enable_dns_support"></a> [vpc\_enable\_dns\_support](#output\_vpc\_enable\_dns\_support) | Whether or not the VPC has DNS support |
| <a name="output_vpc_endpoint_access_analyzer_dns_entry"></a> [vpc\_endpoint\_access\_analyzer\_dns\_entry](#output\_vpc\_endpoint\_access\_analyzer\_dns\_entry) | The DNS entries for the VPC Endpoint for Access Analyzer. |
| <a name="output_vpc_endpoint_access_analyzer_id"></a> [vpc\_endpoint\_access\_analyzer\_id](#output\_vpc\_endpoint\_access\_analyzer\_id) | The ID of VPC endpoint for Access Analyzer |
| <a name="output_vpc_endpoint_access_analyzer_network_interface_ids"></a> [vpc\_endpoint\_access\_analyzer\_network\_interface\_ids](#output\_vpc\_endpoint\_access\_analyzer\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Access Analyzer. |
| <a name="output_vpc_endpoint_acm_pca_dns_entry"></a> [vpc\_endpoint\_acm\_pca\_dns\_entry](#output\_vpc\_endpoint\_acm\_pca\_dns\_entry) | The DNS entries for the VPC Endpoint for ACM PCA. |
| <a name="output_vpc_endpoint_acm_pca_id"></a> [vpc\_endpoint\_acm\_pca\_id](#output\_vpc\_endpoint\_acm\_pca\_id) | The ID of VPC endpoint for ACM PCA |
| <a name="output_vpc_endpoint_acm_pca_network_interface_ids"></a> [vpc\_endpoint\_acm\_pca\_network\_interface\_ids](#output\_vpc\_endpoint\_acm\_pca\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for ACM PCA. |
| <a name="output_vpc_endpoint_apigw_dns_entry"></a> [vpc\_endpoint\_apigw\_dns\_entry](#output\_vpc\_endpoint\_apigw\_dns\_entry) | The DNS entries for the VPC Endpoint for APIGW. |
| <a name="output_vpc_endpoint_apigw_id"></a> [vpc\_endpoint\_apigw\_id](#output\_vpc\_endpoint\_apigw\_id) | The ID of VPC endpoint for APIGW |
| <a name="output_vpc_endpoint_apigw_network_interface_ids"></a> [vpc\_endpoint\_apigw\_network\_interface\_ids](#output\_vpc\_endpoint\_apigw\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for APIGW. |
| <a name="output_vpc_endpoint_appmesh_envoy_management_dns_entry"></a> [vpc\_endpoint\_appmesh\_envoy\_management\_dns\_entry](#output\_vpc\_endpoint\_appmesh\_envoy\_management\_dns\_entry) | The DNS entries for the VPC Endpoint for AppMesh. |
| <a name="output_vpc_endpoint_appmesh_envoy_management_id"></a> [vpc\_endpoint\_appmesh\_envoy\_management\_id](#output\_vpc\_endpoint\_appmesh\_envoy\_management\_id) | The ID of VPC endpoint for AppMesh |
| <a name="output_vpc_endpoint_appmesh_envoy_management_network_interface_ids"></a> [vpc\_endpoint\_appmesh\_envoy\_management\_network\_interface\_ids](#output\_vpc\_endpoint\_appmesh\_envoy\_management\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for AppMesh. |
| <a name="output_vpc_endpoint_appstream_api_dns_entry"></a> [vpc\_endpoint\_appstream\_api\_dns\_entry](#output\_vpc\_endpoint\_appstream\_api\_dns\_entry) | The DNS entries for the VPC Endpoint for AppStream API. |
| <a name="output_vpc_endpoint_appstream_api_id"></a> [vpc\_endpoint\_appstream\_api\_id](#output\_vpc\_endpoint\_appstream\_api\_id) | The ID of VPC endpoint for AppStream API |
| <a name="output_vpc_endpoint_appstream_api_network_interface_ids"></a> [vpc\_endpoint\_appstream\_api\_network\_interface\_ids](#output\_vpc\_endpoint\_appstream\_api\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for AppStream API. |
| <a name="output_vpc_endpoint_appstream_streaming_dns_entry"></a> [vpc\_endpoint\_appstream\_streaming\_dns\_entry](#output\_vpc\_endpoint\_appstream\_streaming\_dns\_entry) | The DNS entries for the VPC Endpoint for AppStream Streaming. |
| <a name="output_vpc_endpoint_appstream_streaming_id"></a> [vpc\_endpoint\_appstream\_streaming\_id](#output\_vpc\_endpoint\_appstream\_streaming\_id) | The ID of VPC endpoint for AppStream Streaming |
| <a name="output_vpc_endpoint_appstream_streaming_network_interface_ids"></a> [vpc\_endpoint\_appstream\_streaming\_network\_interface\_ids](#output\_vpc\_endpoint\_appstream\_streaming\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for AppStream Streaming. |
| <a name="output_vpc_endpoint_athena_dns_entry"></a> [vpc\_endpoint\_athena\_dns\_entry](#output\_vpc\_endpoint\_athena\_dns\_entry) | The DNS entries for the VPC Endpoint for Athena. |
| <a name="output_vpc_endpoint_athena_id"></a> [vpc\_endpoint\_athena\_id](#output\_vpc\_endpoint\_athena\_id) | The ID of VPC endpoint for Athena |
| <a name="output_vpc_endpoint_athena_network_interface_ids"></a> [vpc\_endpoint\_athena\_network\_interface\_ids](#output\_vpc\_endpoint\_athena\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Athena. |
| <a name="output_vpc_endpoint_auto_scaling_plans_dns_entry"></a> [vpc\_endpoint\_auto\_scaling\_plans\_dns\_entry](#output\_vpc\_endpoint\_auto\_scaling\_plans\_dns\_entry) | The DNS entries for the VPC Endpoint for Auto Scaling Plans. |
| <a name="output_vpc_endpoint_auto_scaling_plans_id"></a> [vpc\_endpoint\_auto\_scaling\_plans\_id](#output\_vpc\_endpoint\_auto\_scaling\_plans\_id) | The ID of VPC endpoint for Auto Scaling Plans |
| <a name="output_vpc_endpoint_auto_scaling_plans_network_interface_ids"></a> [vpc\_endpoint\_auto\_scaling\_plans\_network\_interface\_ids](#output\_vpc\_endpoint\_auto\_scaling\_plans\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Auto Scaling Plans. |
| <a name="output_vpc_endpoint_cloud_directory_dns_entry"></a> [vpc\_endpoint\_cloud\_directory\_dns\_entry](#output\_vpc\_endpoint\_cloud\_directory\_dns\_entry) | The DNS entries for the VPC Endpoint for Cloud Directory. |
| <a name="output_vpc_endpoint_cloud_directory_id"></a> [vpc\_endpoint\_cloud\_directory\_id](#output\_vpc\_endpoint\_cloud\_directory\_id) | The ID of VPC endpoint for Cloud Directory |
| <a name="output_vpc_endpoint_cloud_directory_network_interface_ids"></a> [vpc\_endpoint\_cloud\_directory\_network\_interface\_ids](#output\_vpc\_endpoint\_cloud\_directory\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Cloud Directory. |
| <a name="output_vpc_endpoint_cloudformation_dns_entry"></a> [vpc\_endpoint\_cloudformation\_dns\_entry](#output\_vpc\_endpoint\_cloudformation\_dns\_entry) | The DNS entries for the VPC Endpoint for Cloudformation. |
| <a name="output_vpc_endpoint_cloudformation_id"></a> [vpc\_endpoint\_cloudformation\_id](#output\_vpc\_endpoint\_cloudformation\_id) | The ID of VPC endpoint for Cloudformation |
| <a name="output_vpc_endpoint_cloudformation_network_interface_ids"></a> [vpc\_endpoint\_cloudformation\_network\_interface\_ids](#output\_vpc\_endpoint\_cloudformation\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Cloudformation. |
| <a name="output_vpc_endpoint_cloudtrail_dns_entry"></a> [vpc\_endpoint\_cloudtrail\_dns\_entry](#output\_vpc\_endpoint\_cloudtrail\_dns\_entry) | The DNS entries for the VPC Endpoint for CloudTrail. |
| <a name="output_vpc_endpoint_cloudtrail_id"></a> [vpc\_endpoint\_cloudtrail\_id](#output\_vpc\_endpoint\_cloudtrail\_id) | The ID of VPC endpoint for CloudTrail |
| <a name="output_vpc_endpoint_cloudtrail_network_interface_ids"></a> [vpc\_endpoint\_cloudtrail\_network\_interface\_ids](#output\_vpc\_endpoint\_cloudtrail\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for CloudTrail. |
| <a name="output_vpc_endpoint_codeartifact_api_dns_entry"></a> [vpc\_endpoint\_codeartifact\_api\_dns\_entry](#output\_vpc\_endpoint\_codeartifact\_api\_dns\_entry) | The DNS entries for the VPC Endpoint for Codeartifact API. |
| <a name="output_vpc_endpoint_codeartifact_api_id"></a> [vpc\_endpoint\_codeartifact\_api\_id](#output\_vpc\_endpoint\_codeartifact\_api\_id) | The ID of VPC endpoint for Codeartifact API |
| <a name="output_vpc_endpoint_codeartifact_api_network_interface_ids"></a> [vpc\_endpoint\_codeartifact\_api\_network\_interface\_ids](#output\_vpc\_endpoint\_codeartifact\_api\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Codeartifact API. |
| <a name="output_vpc_endpoint_codeartifact_repositories_dns_entry"></a> [vpc\_endpoint\_codeartifact\_repositories\_dns\_entry](#output\_vpc\_endpoint\_codeartifact\_repositories\_dns\_entry) | The DNS entries for the VPC Endpoint for Codeartifact repositories. |
| <a name="output_vpc_endpoint_codeartifact_repositories_id"></a> [vpc\_endpoint\_codeartifact\_repositories\_id](#output\_vpc\_endpoint\_codeartifact\_repositories\_id) | The ID of VPC endpoint for Codeartifact repositories |
| <a name="output_vpc_endpoint_codeartifact_repositories_network_interface_ids"></a> [vpc\_endpoint\_codeartifact\_repositories\_network\_interface\_ids](#output\_vpc\_endpoint\_codeartifact\_repositories\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Codeartifact repositories. |
| <a name="output_vpc_endpoint_codebuild_dns_entry"></a> [vpc\_endpoint\_codebuild\_dns\_entry](#output\_vpc\_endpoint\_codebuild\_dns\_entry) | The DNS entries for the VPC Endpoint for codebuild. |
| <a name="output_vpc_endpoint_codebuild_id"></a> [vpc\_endpoint\_codebuild\_id](#output\_vpc\_endpoint\_codebuild\_id) | The ID of VPC endpoint for codebuild |
| <a name="output_vpc_endpoint_codebuild_network_interface_ids"></a> [vpc\_endpoint\_codebuild\_network\_interface\_ids](#output\_vpc\_endpoint\_codebuild\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for codebuild. |
| <a name="output_vpc_endpoint_codecommit_dns_entry"></a> [vpc\_endpoint\_codecommit\_dns\_entry](#output\_vpc\_endpoint\_codecommit\_dns\_entry) | The DNS entries for the VPC Endpoint for codecommit. |
| <a name="output_vpc_endpoint_codecommit_id"></a> [vpc\_endpoint\_codecommit\_id](#output\_vpc\_endpoint\_codecommit\_id) | The ID of VPC endpoint for codecommit |
| <a name="output_vpc_endpoint_codecommit_network_interface_ids"></a> [vpc\_endpoint\_codecommit\_network\_interface\_ids](#output\_vpc\_endpoint\_codecommit\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for codecommit. |
| <a name="output_vpc_endpoint_codepipeline_dns_entry"></a> [vpc\_endpoint\_codepipeline\_dns\_entry](#output\_vpc\_endpoint\_codepipeline\_dns\_entry) | The DNS entries for the VPC Endpoint for CodePipeline. |
| <a name="output_vpc_endpoint_codepipeline_id"></a> [vpc\_endpoint\_codepipeline\_id](#output\_vpc\_endpoint\_codepipeline\_id) | The ID of VPC endpoint for CodePipeline |
| <a name="output_vpc_endpoint_codepipeline_network_interface_ids"></a> [vpc\_endpoint\_codepipeline\_network\_interface\_ids](#output\_vpc\_endpoint\_codepipeline\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for CodePipeline. |
| <a name="output_vpc_endpoint_config_dns_entry"></a> [vpc\_endpoint\_config\_dns\_entry](#output\_vpc\_endpoint\_config\_dns\_entry) | The DNS entries for the VPC Endpoint for config. |
| <a name="output_vpc_endpoint_config_id"></a> [vpc\_endpoint\_config\_id](#output\_vpc\_endpoint\_config\_id) | The ID of VPC endpoint for config |
| <a name="output_vpc_endpoint_config_network_interface_ids"></a> [vpc\_endpoint\_config\_network\_interface\_ids](#output\_vpc\_endpoint\_config\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for config. |
| <a name="output_vpc_endpoint_datasync_dns_entry"></a> [vpc\_endpoint\_datasync\_dns\_entry](#output\_vpc\_endpoint\_datasync\_dns\_entry) | The DNS entries for the VPC Endpoint for DataSync. |
| <a name="output_vpc_endpoint_datasync_id"></a> [vpc\_endpoint\_datasync\_id](#output\_vpc\_endpoint\_datasync\_id) | The ID of VPC endpoint for DataSync |
| <a name="output_vpc_endpoint_datasync_network_interface_ids"></a> [vpc\_endpoint\_datasync\_network\_interface\_ids](#output\_vpc\_endpoint\_datasync\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for DataSync. |
| <a name="output_vpc_endpoint_dms_dns_entry"></a> [vpc\_endpoint\_dms\_dns\_entry](#output\_vpc\_endpoint\_dms\_dns\_entry) | The DNS entries for the VPC Endpoint for DMS. |
| <a name="output_vpc_endpoint_dms_id"></a> [vpc\_endpoint\_dms\_id](#output\_vpc\_endpoint\_dms\_id) | The ID of VPC endpoint for DMS |
| <a name="output_vpc_endpoint_dms_network_interface_ids"></a> [vpc\_endpoint\_dms\_network\_interface\_ids](#output\_vpc\_endpoint\_dms\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for DMS. |
| <a name="output_vpc_endpoint_dynamodb_id"></a> [vpc\_endpoint\_dynamodb\_id](#output\_vpc\_endpoint\_dynamodb\_id) | The ID of VPC endpoint for DynamoDB |
| <a name="output_vpc_endpoint_dynamodb_pl_id"></a> [vpc\_endpoint\_dynamodb\_pl\_id](#output\_vpc\_endpoint\_dynamodb\_pl\_id) | The prefix list for the DynamoDB VPC endpoint. |
| <a name="output_vpc_endpoint_ebs_dns_entry"></a> [vpc\_endpoint\_ebs\_dns\_entry](#output\_vpc\_endpoint\_ebs\_dns\_entry) | The DNS entries for the VPC Endpoint for EBS. |
| <a name="output_vpc_endpoint_ebs_id"></a> [vpc\_endpoint\_ebs\_id](#output\_vpc\_endpoint\_ebs\_id) | The ID of VPC endpoint for EBS |
| <a name="output_vpc_endpoint_ebs_network_interface_ids"></a> [vpc\_endpoint\_ebs\_network\_interface\_ids](#output\_vpc\_endpoint\_ebs\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for EBS. |
| <a name="output_vpc_endpoint_ec2_autoscaling_dns_entry"></a> [vpc\_endpoint\_ec2\_autoscaling\_dns\_entry](#output\_vpc\_endpoint\_ec2\_autoscaling\_dns\_entry) | The DNS entries for the VPC Endpoint for EC2 Autoscaling. |
| <a name="output_vpc_endpoint_ec2_autoscaling_id"></a> [vpc\_endpoint\_ec2\_autoscaling\_id](#output\_vpc\_endpoint\_ec2\_autoscaling\_id) | The ID of VPC endpoint for EC2 Autoscaling |
| <a name="output_vpc_endpoint_ec2_autoscaling_network_interface_ids"></a> [vpc\_endpoint\_ec2\_autoscaling\_network\_interface\_ids](#output\_vpc\_endpoint\_ec2\_autoscaling\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for EC2 Autoscaling |
| <a name="output_vpc_endpoint_ec2_dns_entry"></a> [vpc\_endpoint\_ec2\_dns\_entry](#output\_vpc\_endpoint\_ec2\_dns\_entry) | The DNS entries for the VPC Endpoint for EC2. |
| <a name="output_vpc_endpoint_ec2_id"></a> [vpc\_endpoint\_ec2\_id](#output\_vpc\_endpoint\_ec2\_id) | The ID of VPC endpoint for EC2 |
| <a name="output_vpc_endpoint_ec2_network_interface_ids"></a> [vpc\_endpoint\_ec2\_network\_interface\_ids](#output\_vpc\_endpoint\_ec2\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for EC2 |
| <a name="output_vpc_endpoint_ec2messages_dns_entry"></a> [vpc\_endpoint\_ec2messages\_dns\_entry](#output\_vpc\_endpoint\_ec2messages\_dns\_entry) | The DNS entries for the VPC Endpoint for EC2MESSAGES. |
| <a name="output_vpc_endpoint_ec2messages_id"></a> [vpc\_endpoint\_ec2messages\_id](#output\_vpc\_endpoint\_ec2messages\_id) | The ID of VPC endpoint for EC2MESSAGES |
| <a name="output_vpc_endpoint_ec2messages_network_interface_ids"></a> [vpc\_endpoint\_ec2messages\_network\_interface\_ids](#output\_vpc\_endpoint\_ec2messages\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for EC2MESSAGES |
| <a name="output_vpc_endpoint_ecr_api_dns_entry"></a> [vpc\_endpoint\_ecr\_api\_dns\_entry](#output\_vpc\_endpoint\_ecr\_api\_dns\_entry) | The DNS entries for the VPC Endpoint for ECR API. |
| <a name="output_vpc_endpoint_ecr_api_id"></a> [vpc\_endpoint\_ecr\_api\_id](#output\_vpc\_endpoint\_ecr\_api\_id) | The ID of VPC endpoint for ECR API |
| <a name="output_vpc_endpoint_ecr_api_network_interface_ids"></a> [vpc\_endpoint\_ecr\_api\_network\_interface\_ids](#output\_vpc\_endpoint\_ecr\_api\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for ECR API. |
| <a name="output_vpc_endpoint_ecr_dkr_dns_entry"></a> [vpc\_endpoint\_ecr\_dkr\_dns\_entry](#output\_vpc\_endpoint\_ecr\_dkr\_dns\_entry) | The DNS entries for the VPC Endpoint for ECR DKR. |
| <a name="output_vpc_endpoint_ecr_dkr_id"></a> [vpc\_endpoint\_ecr\_dkr\_id](#output\_vpc\_endpoint\_ecr\_dkr\_id) | The ID of VPC endpoint for ECR DKR |
| <a name="output_vpc_endpoint_ecr_dkr_network_interface_ids"></a> [vpc\_endpoint\_ecr\_dkr\_network\_interface\_ids](#output\_vpc\_endpoint\_ecr\_dkr\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for ECR DKR. |
| <a name="output_vpc_endpoint_ecs_agent_dns_entry"></a> [vpc\_endpoint\_ecs\_agent\_dns\_entry](#output\_vpc\_endpoint\_ecs\_agent\_dns\_entry) | The DNS entries for the VPC Endpoint for ECS Agent. |
| <a name="output_vpc_endpoint_ecs_agent_id"></a> [vpc\_endpoint\_ecs\_agent\_id](#output\_vpc\_endpoint\_ecs\_agent\_id) | The ID of VPC endpoint for ECS Agent |
| <a name="output_vpc_endpoint_ecs_agent_network_interface_ids"></a> [vpc\_endpoint\_ecs\_agent\_network\_interface\_ids](#output\_vpc\_endpoint\_ecs\_agent\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for ECS Agent. |
| <a name="output_vpc_endpoint_ecs_dns_entry"></a> [vpc\_endpoint\_ecs\_dns\_entry](#output\_vpc\_endpoint\_ecs\_dns\_entry) | The DNS entries for the VPC Endpoint for ECS. |
| <a name="output_vpc_endpoint_ecs_id"></a> [vpc\_endpoint\_ecs\_id](#output\_vpc\_endpoint\_ecs\_id) | The ID of VPC endpoint for ECS |
| <a name="output_vpc_endpoint_ecs_network_interface_ids"></a> [vpc\_endpoint\_ecs\_network\_interface\_ids](#output\_vpc\_endpoint\_ecs\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for ECS. |
| <a name="output_vpc_endpoint_ecs_telemetry_dns_entry"></a> [vpc\_endpoint\_ecs\_telemetry\_dns\_entry](#output\_vpc\_endpoint\_ecs\_telemetry\_dns\_entry) | The DNS entries for the VPC Endpoint for ECS Telemetry. |
| <a name="output_vpc_endpoint_ecs_telemetry_id"></a> [vpc\_endpoint\_ecs\_telemetry\_id](#output\_vpc\_endpoint\_ecs\_telemetry\_id) | The ID of VPC endpoint for ECS Telemetry |
| <a name="output_vpc_endpoint_ecs_telemetry_network_interface_ids"></a> [vpc\_endpoint\_ecs\_telemetry\_network\_interface\_ids](#output\_vpc\_endpoint\_ecs\_telemetry\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for ECS Telemetry. |
| <a name="output_vpc_endpoint_efs_dns_entry"></a> [vpc\_endpoint\_efs\_dns\_entry](#output\_vpc\_endpoint\_efs\_dns\_entry) | The DNS entries for the VPC Endpoint for EFS. |
| <a name="output_vpc_endpoint_efs_id"></a> [vpc\_endpoint\_efs\_id](#output\_vpc\_endpoint\_efs\_id) | The ID of VPC endpoint for EFS |
| <a name="output_vpc_endpoint_efs_network_interface_ids"></a> [vpc\_endpoint\_efs\_network\_interface\_ids](#output\_vpc\_endpoint\_efs\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for EFS. |
| <a name="output_vpc_endpoint_elastic_inference_runtime_dns_entry"></a> [vpc\_endpoint\_elastic\_inference\_runtime\_dns\_entry](#output\_vpc\_endpoint\_elastic\_inference\_runtime\_dns\_entry) | The DNS entries for the VPC Endpoint for Elastic Inference Runtime. |
| <a name="output_vpc_endpoint_elastic_inference_runtime_id"></a> [vpc\_endpoint\_elastic\_inference\_runtime\_id](#output\_vpc\_endpoint\_elastic\_inference\_runtime\_id) | The ID of VPC endpoint for Elastic Inference Runtime |
| <a name="output_vpc_endpoint_elastic_inference_runtime_network_interface_ids"></a> [vpc\_endpoint\_elastic\_inference\_runtime\_network\_interface\_ids](#output\_vpc\_endpoint\_elastic\_inference\_runtime\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Elastic Inference Runtime. |
| <a name="output_vpc_endpoint_elasticbeanstalk_dns_entry"></a> [vpc\_endpoint\_elasticbeanstalk\_dns\_entry](#output\_vpc\_endpoint\_elasticbeanstalk\_dns\_entry) | The DNS entries for the VPC Endpoint for Elastic Beanstalk. |
| <a name="output_vpc_endpoint_elasticbeanstalk_health_dns_entry"></a> [vpc\_endpoint\_elasticbeanstalk\_health\_dns\_entry](#output\_vpc\_endpoint\_elasticbeanstalk\_health\_dns\_entry) | The DNS entries for the VPC Endpoint for Elastic Beanstalk Health. |
| <a name="output_vpc_endpoint_elasticbeanstalk_health_id"></a> [vpc\_endpoint\_elasticbeanstalk\_health\_id](#output\_vpc\_endpoint\_elasticbeanstalk\_health\_id) | The ID of VPC endpoint for Elastic Beanstalk Health |
| <a name="output_vpc_endpoint_elasticbeanstalk_health_network_interface_ids"></a> [vpc\_endpoint\_elasticbeanstalk\_health\_network\_interface\_ids](#output\_vpc\_endpoint\_elasticbeanstalk\_health\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Elastic Beanstalk Health. |
| <a name="output_vpc_endpoint_elasticbeanstalk_id"></a> [vpc\_endpoint\_elasticbeanstalk\_id](#output\_vpc\_endpoint\_elasticbeanstalk\_id) | The ID of VPC endpoint for Elastic Beanstalk |
| <a name="output_vpc_endpoint_elasticbeanstalk_network_interface_ids"></a> [vpc\_endpoint\_elasticbeanstalk\_network\_interface\_ids](#output\_vpc\_endpoint\_elasticbeanstalk\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Elastic Beanstalk. |
| <a name="output_vpc_endpoint_elasticloadbalancing_dns_entry"></a> [vpc\_endpoint\_elasticloadbalancing\_dns\_entry](#output\_vpc\_endpoint\_elasticloadbalancing\_dns\_entry) | The DNS entries for the VPC Endpoint for Elastic Load Balancing. |
| <a name="output_vpc_endpoint_elasticloadbalancing_id"></a> [vpc\_endpoint\_elasticloadbalancing\_id](#output\_vpc\_endpoint\_elasticloadbalancing\_id) | The ID of VPC endpoint for Elastic Load Balancing |
| <a name="output_vpc_endpoint_elasticloadbalancing_network_interface_ids"></a> [vpc\_endpoint\_elasticloadbalancing\_network\_interface\_ids](#output\_vpc\_endpoint\_elasticloadbalancing\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Elastic Load Balancing. |
| <a name="output_vpc_endpoint_elasticmapreduce_dns_entry"></a> [vpc\_endpoint\_elasticmapreduce\_dns\_entry](#output\_vpc\_endpoint\_elasticmapreduce\_dns\_entry) | The DNS entries for the VPC Endpoint for EMR. |
| <a name="output_vpc_endpoint_elasticmapreduce_id"></a> [vpc\_endpoint\_elasticmapreduce\_id](#output\_vpc\_endpoint\_elasticmapreduce\_id) | The ID of VPC endpoint for EMR |
| <a name="output_vpc_endpoint_elasticmapreduce_network_interface_ids"></a> [vpc\_endpoint\_elasticmapreduce\_network\_interface\_ids](#output\_vpc\_endpoint\_elasticmapreduce\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for EMR. |
| <a name="output_vpc_endpoint_events_dns_entry"></a> [vpc\_endpoint\_events\_dns\_entry](#output\_vpc\_endpoint\_events\_dns\_entry) | The DNS entries for the VPC Endpoint for CloudWatch Events. |
| <a name="output_vpc_endpoint_events_id"></a> [vpc\_endpoint\_events\_id](#output\_vpc\_endpoint\_events\_id) | The ID of VPC endpoint for CloudWatch Events |
| <a name="output_vpc_endpoint_events_network_interface_ids"></a> [vpc\_endpoint\_events\_network\_interface\_ids](#output\_vpc\_endpoint\_events\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for CloudWatch Events. |
| <a name="output_vpc_endpoint_git_codecommit_dns_entry"></a> [vpc\_endpoint\_git\_codecommit\_dns\_entry](#output\_vpc\_endpoint\_git\_codecommit\_dns\_entry) | The DNS entries for the VPC Endpoint for git\_codecommit. |
| <a name="output_vpc_endpoint_git_codecommit_id"></a> [vpc\_endpoint\_git\_codecommit\_id](#output\_vpc\_endpoint\_git\_codecommit\_id) | The ID of VPC endpoint for git\_codecommit |
| <a name="output_vpc_endpoint_git_codecommit_network_interface_ids"></a> [vpc\_endpoint\_git\_codecommit\_network\_interface\_ids](#output\_vpc\_endpoint\_git\_codecommit\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for git\_codecommit. |
| <a name="output_vpc_endpoint_glue_dns_entry"></a> [vpc\_endpoint\_glue\_dns\_entry](#output\_vpc\_endpoint\_glue\_dns\_entry) | The DNS entries for the VPC Endpoint for Glue. |
| <a name="output_vpc_endpoint_glue_id"></a> [vpc\_endpoint\_glue\_id](#output\_vpc\_endpoint\_glue\_id) | The ID of VPC endpoint for Glue |
| <a name="output_vpc_endpoint_glue_network_interface_ids"></a> [vpc\_endpoint\_glue\_network\_interface\_ids](#output\_vpc\_endpoint\_glue\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Glue. |
| <a name="output_vpc_endpoint_kinesis_firehose_dns_entry"></a> [vpc\_endpoint\_kinesis\_firehose\_dns\_entry](#output\_vpc\_endpoint\_kinesis\_firehose\_dns\_entry) | The DNS entries for the VPC Endpoint for Kinesis Firehose. |
| <a name="output_vpc_endpoint_kinesis_firehose_id"></a> [vpc\_endpoint\_kinesis\_firehose\_id](#output\_vpc\_endpoint\_kinesis\_firehose\_id) | The ID of VPC endpoint for Kinesis Firehose |
| <a name="output_vpc_endpoint_kinesis_firehose_network_interface_ids"></a> [vpc\_endpoint\_kinesis\_firehose\_network\_interface\_ids](#output\_vpc\_endpoint\_kinesis\_firehose\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Kinesis Firehose. |
| <a name="output_vpc_endpoint_kinesis_streams_dns_entry"></a> [vpc\_endpoint\_kinesis\_streams\_dns\_entry](#output\_vpc\_endpoint\_kinesis\_streams\_dns\_entry) | The DNS entries for the VPC Endpoint for Kinesis Streams. |
| <a name="output_vpc_endpoint_kinesis_streams_id"></a> [vpc\_endpoint\_kinesis\_streams\_id](#output\_vpc\_endpoint\_kinesis\_streams\_id) | The ID of VPC endpoint for Kinesis Streams |
| <a name="output_vpc_endpoint_kinesis_streams_network_interface_ids"></a> [vpc\_endpoint\_kinesis\_streams\_network\_interface\_ids](#output\_vpc\_endpoint\_kinesis\_streams\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Kinesis Streams. |
| <a name="output_vpc_endpoint_kms_dns_entry"></a> [vpc\_endpoint\_kms\_dns\_entry](#output\_vpc\_endpoint\_kms\_dns\_entry) | The DNS entries for the VPC Endpoint for KMS. |
| <a name="output_vpc_endpoint_kms_id"></a> [vpc\_endpoint\_kms\_id](#output\_vpc\_endpoint\_kms\_id) | The ID of VPC endpoint for KMS |
| <a name="output_vpc_endpoint_kms_network_interface_ids"></a> [vpc\_endpoint\_kms\_network\_interface\_ids](#output\_vpc\_endpoint\_kms\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for KMS. |
| <a name="output_vpc_endpoint_lambda_dns_entry"></a> [vpc\_endpoint\_lambda\_dns\_entry](#output\_vpc\_endpoint\_lambda\_dns\_entry) | The DNS entries for the VPC Endpoint for Lambda. |
| <a name="output_vpc_endpoint_lambda_id"></a> [vpc\_endpoint\_lambda\_id](#output\_vpc\_endpoint\_lambda\_id) | The ID of VPC endpoint for Lambda |
| <a name="output_vpc_endpoint_lambda_network_interface_ids"></a> [vpc\_endpoint\_lambda\_network\_interface\_ids](#output\_vpc\_endpoint\_lambda\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Lambda. |
| <a name="output_vpc_endpoint_logs_dns_entry"></a> [vpc\_endpoint\_logs\_dns\_entry](#output\_vpc\_endpoint\_logs\_dns\_entry) | The DNS entries for the VPC Endpoint for CloudWatch Logs. |
| <a name="output_vpc_endpoint_logs_id"></a> [vpc\_endpoint\_logs\_id](#output\_vpc\_endpoint\_logs\_id) | The ID of VPC endpoint for CloudWatch Logs |
| <a name="output_vpc_endpoint_logs_network_interface_ids"></a> [vpc\_endpoint\_logs\_network\_interface\_ids](#output\_vpc\_endpoint\_logs\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for CloudWatch Logs. |
| <a name="output_vpc_endpoint_monitoring_dns_entry"></a> [vpc\_endpoint\_monitoring\_dns\_entry](#output\_vpc\_endpoint\_monitoring\_dns\_entry) | The DNS entries for the VPC Endpoint for CloudWatch Monitoring. |
| <a name="output_vpc_endpoint_monitoring_id"></a> [vpc\_endpoint\_monitoring\_id](#output\_vpc\_endpoint\_monitoring\_id) | The ID of VPC endpoint for CloudWatch Monitoring |
| <a name="output_vpc_endpoint_monitoring_network_interface_ids"></a> [vpc\_endpoint\_monitoring\_network\_interface\_ids](#output\_vpc\_endpoint\_monitoring\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for CloudWatch Monitoring. |
| <a name="output_vpc_endpoint_qldb_session_dns_entry"></a> [vpc\_endpoint\_qldb\_session\_dns\_entry](#output\_vpc\_endpoint\_qldb\_session\_dns\_entry) | The DNS entries for the VPC Endpoint for QLDB Session. |
| <a name="output_vpc_endpoint_qldb_session_id"></a> [vpc\_endpoint\_qldb\_session\_id](#output\_vpc\_endpoint\_qldb\_session\_id) | The ID of VPC endpoint for QLDB Session |
| <a name="output_vpc_endpoint_qldb_session_network_interface_ids"></a> [vpc\_endpoint\_qldb\_session\_network\_interface\_ids](#output\_vpc\_endpoint\_qldb\_session\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for QLDB Session. |
| <a name="output_vpc_endpoint_rds_dns_entry"></a> [vpc\_endpoint\_rds\_dns\_entry](#output\_vpc\_endpoint\_rds\_dns\_entry) | The DNS entries for the VPC Endpoint for RDS. |
| <a name="output_vpc_endpoint_rds_id"></a> [vpc\_endpoint\_rds\_id](#output\_vpc\_endpoint\_rds\_id) | The ID of VPC endpoint for RDS |
| <a name="output_vpc_endpoint_rds_network_interface_ids"></a> [vpc\_endpoint\_rds\_network\_interface\_ids](#output\_vpc\_endpoint\_rds\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for RDS. |
| <a name="output_vpc_endpoint_rekognition_dns_entry"></a> [vpc\_endpoint\_rekognition\_dns\_entry](#output\_vpc\_endpoint\_rekognition\_dns\_entry) | The DNS entries for the VPC Endpoint for Rekognition. |
| <a name="output_vpc_endpoint_rekognition_id"></a> [vpc\_endpoint\_rekognition\_id](#output\_vpc\_endpoint\_rekognition\_id) | The ID of VPC endpoint for Rekognition |
| <a name="output_vpc_endpoint_rekognition_network_interface_ids"></a> [vpc\_endpoint\_rekognition\_network\_interface\_ids](#output\_vpc\_endpoint\_rekognition\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Rekognition. |
| <a name="output_vpc_endpoint_s3_id"></a> [vpc\_endpoint\_s3\_id](#output\_vpc\_endpoint\_s3\_id) | The ID of VPC endpoint for S3 |
| <a name="output_vpc_endpoint_s3_pl_id"></a> [vpc\_endpoint\_s3\_pl\_id](#output\_vpc\_endpoint\_s3\_pl\_id) | The prefix list for the S3 VPC endpoint. |
| <a name="output_vpc_endpoint_sagemaker_api_dns_entry"></a> [vpc\_endpoint\_sagemaker\_api\_dns\_entry](#output\_vpc\_endpoint\_sagemaker\_api\_dns\_entry) | The DNS entries for the VPC Endpoint for SageMaker API. |
| <a name="output_vpc_endpoint_sagemaker_api_id"></a> [vpc\_endpoint\_sagemaker\_api\_id](#output\_vpc\_endpoint\_sagemaker\_api\_id) | The ID of VPC endpoint for SageMaker API |
| <a name="output_vpc_endpoint_sagemaker_api_network_interface_ids"></a> [vpc\_endpoint\_sagemaker\_api\_network\_interface\_ids](#output\_vpc\_endpoint\_sagemaker\_api\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SageMaker API. |
| <a name="output_vpc_endpoint_sagemaker_runtime_dns_entry"></a> [vpc\_endpoint\_sagemaker\_runtime\_dns\_entry](#output\_vpc\_endpoint\_sagemaker\_runtime\_dns\_entry) | The DNS entries for the VPC Endpoint for SageMaker Runtime. |
| <a name="output_vpc_endpoint_sagemaker_runtime_id"></a> [vpc\_endpoint\_sagemaker\_runtime\_id](#output\_vpc\_endpoint\_sagemaker\_runtime\_id) | The ID of VPC endpoint for SageMaker Runtime |
| <a name="output_vpc_endpoint_sagemaker_runtime_network_interface_ids"></a> [vpc\_endpoint\_sagemaker\_runtime\_network\_interface\_ids](#output\_vpc\_endpoint\_sagemaker\_runtime\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SageMaker Runtime. |
| <a name="output_vpc_endpoint_secretsmanager_dns_entry"></a> [vpc\_endpoint\_secretsmanager\_dns\_entry](#output\_vpc\_endpoint\_secretsmanager\_dns\_entry) | The DNS entries for the VPC Endpoint for secretsmanager. |
| <a name="output_vpc_endpoint_secretsmanager_id"></a> [vpc\_endpoint\_secretsmanager\_id](#output\_vpc\_endpoint\_secretsmanager\_id) | The ID of VPC endpoint for secretsmanager |
| <a name="output_vpc_endpoint_secretsmanager_network_interface_ids"></a> [vpc\_endpoint\_secretsmanager\_network\_interface\_ids](#output\_vpc\_endpoint\_secretsmanager\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for secretsmanager. |
| <a name="output_vpc_endpoint_servicecatalog_dns_entry"></a> [vpc\_endpoint\_servicecatalog\_dns\_entry](#output\_vpc\_endpoint\_servicecatalog\_dns\_entry) | The DNS entries for the VPC Endpoint for Service Catalog. |
| <a name="output_vpc_endpoint_servicecatalog_id"></a> [vpc\_endpoint\_servicecatalog\_id](#output\_vpc\_endpoint\_servicecatalog\_id) | The ID of VPC endpoint for Service Catalog |
| <a name="output_vpc_endpoint_servicecatalog_network_interface_ids"></a> [vpc\_endpoint\_servicecatalog\_network\_interface\_ids](#output\_vpc\_endpoint\_servicecatalog\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Service Catalog. |
| <a name="output_vpc_endpoint_ses_dns_entry"></a> [vpc\_endpoint\_ses\_dns\_entry](#output\_vpc\_endpoint\_ses\_dns\_entry) | The DNS entries for the VPC Endpoint for SES. |
| <a name="output_vpc_endpoint_ses_id"></a> [vpc\_endpoint\_ses\_id](#output\_vpc\_endpoint\_ses\_id) | The ID of VPC endpoint for SES |
| <a name="output_vpc_endpoint_ses_network_interface_ids"></a> [vpc\_endpoint\_ses\_network\_interface\_ids](#output\_vpc\_endpoint\_ses\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SES. |
| <a name="output_vpc_endpoint_sms_dns_entry"></a> [vpc\_endpoint\_sms\_dns\_entry](#output\_vpc\_endpoint\_sms\_dns\_entry) | The DNS entries for the VPC Endpoint for SMS. |
| <a name="output_vpc_endpoint_sms_id"></a> [vpc\_endpoint\_sms\_id](#output\_vpc\_endpoint\_sms\_id) | The ID of VPC endpoint for SMS |
| <a name="output_vpc_endpoint_sms_network_interface_ids"></a> [vpc\_endpoint\_sms\_network\_interface\_ids](#output\_vpc\_endpoint\_sms\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SMS. |
| <a name="output_vpc_endpoint_sns_dns_entry"></a> [vpc\_endpoint\_sns\_dns\_entry](#output\_vpc\_endpoint\_sns\_dns\_entry) | The DNS entries for the VPC Endpoint for SNS. |
| <a name="output_vpc_endpoint_sns_id"></a> [vpc\_endpoint\_sns\_id](#output\_vpc\_endpoint\_sns\_id) | The ID of VPC endpoint for SNS |
| <a name="output_vpc_endpoint_sns_network_interface_ids"></a> [vpc\_endpoint\_sns\_network\_interface\_ids](#output\_vpc\_endpoint\_sns\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SNS. |
| <a name="output_vpc_endpoint_sqs_dns_entry"></a> [vpc\_endpoint\_sqs\_dns\_entry](#output\_vpc\_endpoint\_sqs\_dns\_entry) | The DNS entries for the VPC Endpoint for SQS. |
| <a name="output_vpc_endpoint_sqs_id"></a> [vpc\_endpoint\_sqs\_id](#output\_vpc\_endpoint\_sqs\_id) | The ID of VPC endpoint for SQS |
| <a name="output_vpc_endpoint_sqs_network_interface_ids"></a> [vpc\_endpoint\_sqs\_network\_interface\_ids](#output\_vpc\_endpoint\_sqs\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SQS. |
| <a name="output_vpc_endpoint_ssm_dns_entry"></a> [vpc\_endpoint\_ssm\_dns\_entry](#output\_vpc\_endpoint\_ssm\_dns\_entry) | The DNS entries for the VPC Endpoint for SSM. |
| <a name="output_vpc_endpoint_ssm_id"></a> [vpc\_endpoint\_ssm\_id](#output\_vpc\_endpoint\_ssm\_id) | The ID of VPC endpoint for SSM |
| <a name="output_vpc_endpoint_ssm_network_interface_ids"></a> [vpc\_endpoint\_ssm\_network\_interface\_ids](#output\_vpc\_endpoint\_ssm\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SSM. |
| <a name="output_vpc_endpoint_ssmmessages_dns_entry"></a> [vpc\_endpoint\_ssmmessages\_dns\_entry](#output\_vpc\_endpoint\_ssmmessages\_dns\_entry) | The DNS entries for the VPC Endpoint for SSMMESSAGES. |
| <a name="output_vpc_endpoint_ssmmessages_id"></a> [vpc\_endpoint\_ssmmessages\_id](#output\_vpc\_endpoint\_ssmmessages\_id) | The ID of VPC endpoint for SSMMESSAGES |
| <a name="output_vpc_endpoint_ssmmessages_network_interface_ids"></a> [vpc\_endpoint\_ssmmessages\_network\_interface\_ids](#output\_vpc\_endpoint\_ssmmessages\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for SSMMESSAGES. |
| <a name="output_vpc_endpoint_states_dns_entry"></a> [vpc\_endpoint\_states\_dns\_entry](#output\_vpc\_endpoint\_states\_dns\_entry) | The DNS entries for the VPC Endpoint for Step Function. |
| <a name="output_vpc_endpoint_states_id"></a> [vpc\_endpoint\_states\_id](#output\_vpc\_endpoint\_states\_id) | The ID of VPC endpoint for Step Function |
| <a name="output_vpc_endpoint_states_network_interface_ids"></a> [vpc\_endpoint\_states\_network\_interface\_ids](#output\_vpc\_endpoint\_states\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Step Function. |
| <a name="output_vpc_endpoint_storagegateway_dns_entry"></a> [vpc\_endpoint\_storagegateway\_dns\_entry](#output\_vpc\_endpoint\_storagegateway\_dns\_entry) | The DNS entries for the VPC Endpoint for Storage Gateway. |
| <a name="output_vpc_endpoint_storagegateway_id"></a> [vpc\_endpoint\_storagegateway\_id](#output\_vpc\_endpoint\_storagegateway\_id) | The ID of VPC endpoint for Storage Gateway |
| <a name="output_vpc_endpoint_storagegateway_network_interface_ids"></a> [vpc\_endpoint\_storagegateway\_network\_interface\_ids](#output\_vpc\_endpoint\_storagegateway\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Storage Gateway. |
| <a name="output_vpc_endpoint_sts_dns_entry"></a> [vpc\_endpoint\_sts\_dns\_entry](#output\_vpc\_endpoint\_sts\_dns\_entry) | The DNS entries for the VPC Endpoint for STS. |
| <a name="output_vpc_endpoint_sts_id"></a> [vpc\_endpoint\_sts\_id](#output\_vpc\_endpoint\_sts\_id) | The ID of VPC endpoint for STS |
| <a name="output_vpc_endpoint_sts_network_interface_ids"></a> [vpc\_endpoint\_sts\_network\_interface\_ids](#output\_vpc\_endpoint\_sts\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for STS. |
| <a name="output_vpc_endpoint_textract_dns_entry"></a> [vpc\_endpoint\_textract\_dns\_entry](#output\_vpc\_endpoint\_textract\_dns\_entry) | The DNS entries for the VPC Endpoint for Textract. |
| <a name="output_vpc_endpoint_textract_id"></a> [vpc\_endpoint\_textract\_id](#output\_vpc\_endpoint\_textract\_id) | The ID of VPC endpoint for Textract |
| <a name="output_vpc_endpoint_textract_network_interface_ids"></a> [vpc\_endpoint\_textract\_network\_interface\_ids](#output\_vpc\_endpoint\_textract\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Textract. |
| <a name="output_vpc_endpoint_transfer_dns_entry"></a> [vpc\_endpoint\_transfer\_dns\_entry](#output\_vpc\_endpoint\_transfer\_dns\_entry) | The DNS entries for the VPC Endpoint for Transfer. |
| <a name="output_vpc_endpoint_transfer_id"></a> [vpc\_endpoint\_transfer\_id](#output\_vpc\_endpoint\_transfer\_id) | The ID of VPC endpoint for Transfer |
| <a name="output_vpc_endpoint_transfer_network_interface_ids"></a> [vpc\_endpoint\_transfer\_network\_interface\_ids](#output\_vpc\_endpoint\_transfer\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Transfer. |
| <a name="output_vpc_endpoint_transferserver_dns_entry"></a> [vpc\_endpoint\_transferserver\_dns\_entry](#output\_vpc\_endpoint\_transferserver\_dns\_entry) | The DNS entries for the VPC Endpoint for transferserver. |
| <a name="output_vpc_endpoint_transferserver_id"></a> [vpc\_endpoint\_transferserver\_id](#output\_vpc\_endpoint\_transferserver\_id) | The ID of VPC endpoint for transferserver |
| <a name="output_vpc_endpoint_transferserver_network_interface_ids"></a> [vpc\_endpoint\_transferserver\_network\_interface\_ids](#output\_vpc\_endpoint\_transferserver\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for transferserver |
| <a name="output_vpc_endpoint_workspaces_dns_entry"></a> [vpc\_endpoint\_workspaces\_dns\_entry](#output\_vpc\_endpoint\_workspaces\_dns\_entry) | The DNS entries for the VPC Endpoint for Workspaces. |
| <a name="output_vpc_endpoint_workspaces_id"></a> [vpc\_endpoint\_workspaces\_id](#output\_vpc\_endpoint\_workspaces\_id) | The ID of VPC endpoint for Workspaces |
| <a name="output_vpc_endpoint_workspaces_network_interface_ids"></a> [vpc\_endpoint\_workspaces\_network\_interface\_ids](#output\_vpc\_endpoint\_workspaces\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint for Workspaces. |
| <a name="output_vpc_flow_log_cloudwatch_iam_role_arn"></a> [vpc\_flow\_log\_cloudwatch\_iam\_role\_arn](#output\_vpc\_flow\_log\_cloudwatch\_iam\_role\_arn) | The ARN of the IAM role used when pushing logs to Cloudwatch log group |
| <a name="output_vpc_flow_log_destination_arn"></a> [vpc\_flow\_log\_destination\_arn](#output\_vpc\_flow\_log\_destination\_arn) | The ARN of the destination for VPC Flow Logs |
| <a name="output_vpc_flow_log_destination_type"></a> [vpc\_flow\_log\_destination\_type](#output\_vpc\_flow\_log\_destination\_type) | The type of the destination for VPC Flow Logs |
| <a name="output_vpc_flow_log_id"></a> [vpc\_flow\_log\_id](#output\_vpc\_flow\_log\_id) | The ID of the Flow Log resource |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpc_instance_tenancy"></a> [vpc\_instance\_tenancy](#output\_vpc\_instance\_tenancy) | Tenancy of instances spin up within VPC |
| <a name="output_vpc_ipv6_association_id"></a> [vpc\_ipv6\_association\_id](#output\_vpc\_ipv6\_association\_id) | The association ID for the IPv6 CIDR block |
| <a name="output_vpc_ipv6_cidr_block"></a> [vpc\_ipv6\_cidr\_block](#output\_vpc\_ipv6\_cidr\_block) | The IPv6 CIDR block |
| <a name="output_vpc_main_route_table_id"></a> [vpc\_main\_route\_table\_id](#output\_vpc\_main\_route\_table\_id) | The ID of the main route table associated with this VPC |
| <a name="output_vpc_owner_id"></a> [vpc\_owner\_id](#output\_vpc\_owner\_id) | The ID of the AWS account that owns the VPC |
| <a name="output_vpc_secondary_cidr_blocks"></a> [vpc\_secondary\_cidr\_blocks](#output\_vpc\_secondary\_cidr\_blocks) | List of secondary CIDR blocks of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
