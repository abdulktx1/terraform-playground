

provider "aws" {
  region = "us-east-1"
}


module "aurora_cluster" {
  source         = "terraform-aws-modules/rds-aurora/aws"
  version        = "7.6.2"
  for_each       = var.aurora_cluster_map
  name           = each.value["cluster_name"]
  engine         = each.value["cluster_engine_type"]
  engine_version = each.value["cluster_engine_version"]
  instance_class = each.value["cluster_engine_instance_type"]
  instances = each.value["cluster_instances_map"]
  vpc_id  = each.value["cluster_instance_vpc_id"]
  subnets = each.value["cluster_instance_subnets_list"]
  allowed_security_groups = each.value["cluster_security_group_id"]
  allowed_cidr_blocks = each.value["cluster_allowed_cidr_blocks"]
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  db_parameter_group_name         = each.value["db_parameter_group_name"] #var.db_parameter_group_name
  db_cluster_parameter_group_name = each.value["db_cluster_parameter_group_name"] #var.db_cluster_parameter_group_name


  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = merge(var.common_tags, each.value.env_tags)
}