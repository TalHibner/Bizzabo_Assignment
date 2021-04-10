######
# Public route53 hosted zone and Alias entry for the ELB
######
module "zones" {
  source = "terraform-aws-modules/route53/aws//modules/zones"

  zones = {
    "bizzaboassignment.com" = {
      comment = "bizzaboassignment.com (bizzabo assignment)"
      tags = {
        Name = "bizzabo-test-hosted-zone"
      }
    }
  }

  tags = {
    Owner       = "talh"
    Terraform = "true"
    Environment = "dev"
    ManagedBy = "Terraform"
  }
}

module "records" {
  source = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = keys(module.zones.this_route53_zone_zone_id)[0]
  zone_id = module.zones.this_route53_zone_zone_id["bizzabo-assignment.com"]

  records = [
    {
      name = "elb"
      type = "A"
      alias = {
        name    = module.elb.dns_name
        zone_id = module.elb.zone_id
        evaluate_target_health = true
      }
    }
  ]

  depends_on = [module.zones]
}

module "disabled_records" {
  source = "terraform-aws-modules/route53/aws//modules/records"

  create = false
}