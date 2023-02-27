variable "aurora_cluster_map" {
  description = "Aurora cluster map"
  type = map(object({
    cluster_name                  = string
    cluster_engine_type           = string
    cluster_engine_version        = string
    cluster_engine_instance_type  = string
    cluster_instance_vpc_id       = string
    cluster_instance_subnets_list = list(string)
    cluster_security_group_id     = list(string)
    cluster_allowed_cidr_blocks   = list(string)
    env_tags                      = map(string)
    cluster_instances_map         = map(map(string))
    db_cluster_parameter_group_name = string
    db_parameter_group_name = string
    # cluster_instance_security_group_id = string
    # cluster_instance_cidr_block = string
    # cluster_instance_storage_encrypted = bool
    # cluster_instance_apply_immediately = bool
    # cluster_instance_monitoring_interval = number
    # cluster_instance_db_parameter_group_name = string
    # cluster_instance_db_cluster_parameter_group_name = string
    # cluster_instance_enabled_cloudwatch_logs_exports = list(string)
    # cluster_instance_tags = map(string)
  }))
  default = {}

}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
  default     = {}
}

variable "cluster_database_name" {
  description = "The name of the database to create when the DB cluster is created. If this parameter is not specified, no database is created in the DB cluster."
  type        = string
  default     = "postgres"
}
# variable "db_cluster_parameter_group_name" {
#   description = "The name of the DB cluster parameter group to associate with this DB cluster. If this argument is omitted, the default DB cluster parameter group for the specified engine and version is used."
#   type        = string
#   default     = "default.aurora-postgresql11"
# }
# variable "db_parameter_group_name" {
#   description = "The name of the DB parameter group to associate with this DB instance. If this argument is omitted, the default DB parameter group for the specified engine and version is used."
#   type        = string
#   default     = "default.aurora-postgresql11"
# }