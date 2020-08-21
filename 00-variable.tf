# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
  type        = string
}

variable "name" {
  description = "Name of the cluster, e.g: dev-demo-postgre"
  type        = string
}

variable "environment" {
  description = "Name of environment this VPC is targeting"
  type        = string
  default     = "dev"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "11.5"
}

variable "instance_type" {
  description = "Instance type for database instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage allocated to database instance"
  type        = number
  default     = 32
}

variable "storage_type" {
  description = "Type of underlying storage for database"
  type        = string
  default     = "gp2"
}

variable "iops" {
  description = "The amount of provisioned IOPS"
  type        = number
  default     = 0
}

variable "vpc_id" {
  description = "ID of VPC meant to house database"
  type        = string
}

variable "subnet_group" {
  description = "Database subnet group"
  type        = string
}

variable "database_identifier" {
  description = "Identifier for RDS instance"
  type        = string
}

variable "snapshot_identifier" {
  description = "The name of the snapshot (if any) the database should be created from"
  type        = string
  default     = ""
}

variable "database_name" {
  description = "Name of database inside storage engine"
  type        = string
  default     = "postgres"
}

variable "database_username" {
  description = "Name of user inside storage engine"
  type        = string
  default     = "postgres"
}

variable "database_password" {
  description = "Database password inside storage engine"
  type        = string
  default     = "postgres"
}

variable "database_port" {
  description = "Port on which database will accept connections"
  type        = number
  default     = 5432
}

variable "backup_retention_period" {
  description = "Number of days to keep database backups"
  type        = number
  default     = 30
}

variable "backup_window" {
  description = "30 minute time window to reserve for backups"
  type        = string
  default     = "04:00-04:30"
  # 12:00AM-12:30AM ET
}

variable "maintenance_window" {
  description = "60 minute time window to reserve for maintenance"
  type        = string
  default     = "sun:04:30-sun:05:30"
  # SUN 12:30AM-01:30AM ET
}

variable "auto_minor_version_upgrade" {
  description = "Minor engine upgrades are applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "Identifier for final snapshot if skip_final_snapshot is set to false"
  type        = string
  default     = "terraform-aws-rds-postgresql-snapshot"
}

variable "skip_final_snapshot" {
  description = "Flag to enable or disable a snapshot if the database instance is terminated"
  type        = bool
  default     = true
}

variable "copy_tags_to_snapshot" {
  description = "Flag to enable or disable copying instance tags to the final snapshot"
  type        = bool
  default     = false
}

variable "multi_availability_zone" {
  description = "Flag to enable hot standby in another availability zone"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Flag to enable storage encryption"
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected"
  type        = number
  default     = 0
}

variable "deletion_protection" {
  description = "Flag to protect the database instance from deletion"
  type        = bool
  default     = false
}

variable "cloudwatch_logs_exports" {
  description = "List of logs to publish to CloudWatch Logs"
  type        = list
  default     = ["postgresql", "upgrade"]
}

variable "parameter_group" {
  description = "Database engine parameter group"
  type        = string
  default     = "default.postgres11"
}

variable "alarm_cpu_threshold" {
  description = "CPU alarm threshold as a percentage"
  type        = number
  default     = 75
}

variable "alarm_disk_queue_threshold" {
  description = "Disk queue alarm threshold"
  type        = number
  default     = 10
}

variable "alarm_free_disk_threshold" {
  description = "Free disk alarm threshold in bytes"
  type        = number
  default     = 5000000000
  # 5GB
}

variable "alarm_free_memory_threshold" {
  description = "Free memory alarm threshold in bytes"
  type        = number
  default     = 128000000
  # 128MB
}

variable "alarm_cpu_credit_balance_threshold" {
  description = "CPU credit balance threshold (only for db.t* instance types)"
  type        = number
  default     = 30
}

variable "alarm_actions" {
  description = "List of ARNs to be notified via CloudWatch when alarm enters ALARM state"
  type        = list
}

variable "ok_actions" {
  description = "List of ARNs to be notified via CloudWatch when alarm enters OK state"
  type        = list
}

variable "insufficient_data_actions" {
  description = "List of ARNs to be notified via CloudWatch when alarm enters INSUFFICIENT_DATA state"
  type        = list
}

variable "tags" {
  description = "Extra tags to attach to the RDS resources"
  type        = map(string)
  default     = {}
}
