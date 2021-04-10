resource "random_pet" "this" {
  length = 2
}

#########################
# S3 bucket for ELB logs
#########################
data "aws_elb_service_account" "this" {}

resource "aws_s3_bucket" "logs" {
  bucket        = "elb-logs-${random_pet.this.id}"
  acl           = "private"
  policy        = data.aws_iam_policy_document.logs.json
  force_destroy = true
}

data "aws_iam_policy_document" "logs" {
  statement {
    actions = [
      "s3:PutObject",
    ]

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.this.arn]
    }

    resources = [
      "arn:aws:s3:::elb-logs-${random_pet.this.id}/*",
    ]
  }
}

##################
# ACM certificate
##################
resource "aws_route53_zone" "this" {
  name          = "bizzaboassignment.com"
  force_destroy = true
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 2.0"

  zone_id = aws_route53_zone.this.zone_id

  domain_name               = "bizzaboassignment.com"
  subject_alternative_names = ["*.bizzaboassignment.comm"]

  wait_for_validation = true
}

######
# ELB - listening on ports 80 & 443
######
module "elb" {
  source = "terraform-aws-modules/elb/aws"

  name = "bizzabo-test-elb"

  subnets         = module.vpc.public_subnets
  security_groups = [module.security_group_http_https.this_security_group_id]
  internal        = false
  cross_zone_load_balancing = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    },
    {
      instance_port     = "443"
      instance_protocol = "https"
      lb_port           = "443"
      lb_protocol       = "https"

      //Note about SSL:
      //This line is commented out because ACM certificate has to be "Active" (validated and verified by AWS, but Route53 zone used in this example is not real).
      //To enable SSL in ELB: uncomment this line, set "wait_for_validation = true" in ACM module and make sure that instance_protocol and lb_protocol are https or ssl.
//      ssl_certificate_id = module.acm.this_acm_certificate_arn
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  access_logs = {
    bucket = aws_s3_bucket.logs.id
  }

  tags = {
    Owner       = "talh"
    Name = "bizzabo-dev-elb"
    Terraform = "true"
    Environment = "dev"
  }

  # ELB attachments
  number_of_instances = var.number_of_instances
//  instances           = module.ec2_instances.id - add it when you want to attach ec2 instance
}

