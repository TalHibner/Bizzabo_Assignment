provider "aws" {
  region = "us-east-1"
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

######
# VPC
######

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "bizzabo-test-vpc"

  cidr = "10.0.0.0/16"

  // 6 subnets needed for high availability. (In the requirements only 4 subnets were needed, the ELB need minimum 2 subnets so...)
  //see: https://aws.amazon.com/blogs/architecture/one-to-many-evolving-vpc-design/
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = true

  ###############
  # Default route tables
  ###############
  //Route tables for each subnet
  manage_default_route_table = true
  default_route_table_tags   = { DefaultRouteTable = true }


  ################
  # Publiс/Private Route Tables
  ################
  //Route tables for each Public/private subnet accordingly
  //Being created automatic with the module using var.public_subnets/private_subnets above
  //There are as many private routing tables as the number of NAT gateways

  ##########################
  # Route table association
  ##########################
  //Being created automatic with the module using var.public_subnets/private_subnets above


  ##############
  # NAT Gateway
  ##############

  //Being created automatic with the module - One NAT Gateway per private subnet (default behavior)
  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = false

  #######################
  # Default Network ACLs
  #######################



  ###################
  # Internet Gateway
  ###################
  //Controls if an Internet Gateway is created for public subnets and the related routes that connect them.
  // public_internet_gateway is being added by the module to the public rout tables with   destination_cidr_block = "0.0.0.0/0" and destination_ipv6_cidr_block = "::/0"
  create_igw = true

  ###################
  # Default Security Group
  ###################

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  ###################
  # VPC Flow Logs
  ###################
  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  ###################
  # Tags
  ###################

  //A map of tags to add to all resources
  tags = {
    Owner       = "talh"
    Terraform = "true"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "bizzabo-dev-vpc"
  }

  igw_tags = {
    Name = "bizzabo-dev-igw"
  }

  nat_gateway_tags = {
    Name = "bizzabo-dev-nat-gateway"
    Region = "us-east-1"
  }

  nat_eip_tags = {
    Name = "bizzabo-dev-nat-eip"
    Region = "us-east-1"
  }

  public_subnet_tags = {
    Name = "bizzabo-dev-public-subnet"
    Region = "us-east-1"
  }

  private_subnet_tags = {
    Name = "bizzabo-dev-private-subnet"
    Region = "us-east-1"
  }

  default_route_table_tags = {
    Name = "bizzabo-dev-default-route-table"
    Region = "us-east-1"
  }

  public_route_table_tags = {
    Name = "bizzabo-dev-public-route-table"
    Region = "us-east-1"
  }

  private_route_table_tags = {
    Name = "bizzabo-dev-private-route-table"
    Region = "us-east-1"
  }

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_classiclink             = true
  enable_classiclink_dns_support = true
}