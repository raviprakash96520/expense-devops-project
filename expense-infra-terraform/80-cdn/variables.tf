variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "frontend_tags" {
    default = {
        Component = "frontend"
    }
}

variable "zone_id" {
    default = "Z0031051EBM8KWCDPDGJ"
}

variable "zone_name" {
    default = "devopswithravi.online"
}
