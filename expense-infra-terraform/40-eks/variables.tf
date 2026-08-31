variable "project_name" {
  type        = string
  default     = "expense"
  description = "Name of the project"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }
  description = "Common tags for all resources"
}