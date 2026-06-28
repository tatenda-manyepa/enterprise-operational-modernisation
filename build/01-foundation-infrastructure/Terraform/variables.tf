variable "aws_region" {
  description = "AWS region used for the foundation infrastructure."
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name for this portfolio build."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for AWS resource naming."
  type        = string
  default     = "aos-modernisation"
}

variable "vpc_cidr" {
  description = "CIDR block for the main VPC."
  type        = string
  default     = "10.0.0.0/16"
}
