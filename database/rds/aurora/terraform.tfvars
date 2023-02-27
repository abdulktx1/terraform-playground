
aurora_cluster_map = {
  "cluster1" = {
    "cluster_name" : "module-cluster1", # Changing name will cause cluster to be destroyed and recreated 
    "cluster_engine_type"         = "aurora-postgresql",
    cluster_engine_version        = "11.12",
    cluster_engine_instance_type  = "db.t3.medium",
    cluster_engine_instance_count = 1,
    cluster_instance_vpc_id       = "vpc-02695efd076f88bf2"
    cluster_instance_subnets_list = ["subnet-0a6ae91e8828b32cd", "subnet-0f498b6eb571a7b4f"]
    cluster_security_group_id     = ["sg-0d17c750535b0e3bb"]
    cluster_allowed_cidr_blocks   = ["10.20.0.0/20"]
    env_tags = {
      Name            = "example-instance-2"
      billing_account = "act-102323"
    }
    cluster_instances_map = {
      writer = { writer = true },
    #  rd1    = { writer = false },
    # Example reader instance with different
     reader-2    = { writer = false
                     instance_class = "db.t3.large" }
    }
    # Example reader instance with custom identifier
    #      reader-2    = { writer = false
    #                 identifier     = "static-member-1" # Changing name will cause cluster to be destroyed and recreated 
    #                  instance_class = "db.t3.large" }
    # }
    db_cluster_parameter_group_name = "default.aurora-postgresql11"
    db_parameter_group_name =  "default.aurora-postgresql11" 
  }
# Cluster 2
  "cluster2" = {
    "cluster_name" : "dev-cluster-2", # Changing name will cause cluster to be destroyed and recreated 
    "cluster_engine_type"         = "aurora-postgresql",
    cluster_engine_version        = "13.7",
    cluster_engine_instance_type  = "db.t3.medium",
    cluster_engine_instance_count = 1,
    cluster_instance_vpc_id       = "vpc-02695efd076f88bf2"
    cluster_instance_subnets_list = ["subnet-0a6ae91e8828b32cd", "subnet-0f498b6eb571a7b4f"]
    cluster_security_group_id     = ["sg-0d17c750535b0e3bb"]
    cluster_allowed_cidr_blocks   = ["10.20.0.0/20"]
    env_tags = {
      Name            = "example-instance-2"
      billing_account = "act-102323"
    }
    cluster_instances_map = {
      writer = { writer = true },
      #  Reader instance Example with default identifier
    #  rd1    = { writer = false },
    # Example reader instance with different
    }
    # Example reader instance with custom identifier
    #      reader-2    = { writer = false
    #                 identifier     = "static-member-1" # Changing name will cause cluster to be destroyed and recreated 
    #                  instance_class = "db.t3.large" }
    # }
    db_cluster_parameter_group_name = "default.aurora-postgresql13"
    db_parameter_group_name =  "default.aurora-postgresql13"  
  }

}

common_tags = {
  Environment = "dev"
  Owner       = "deleteme"
}