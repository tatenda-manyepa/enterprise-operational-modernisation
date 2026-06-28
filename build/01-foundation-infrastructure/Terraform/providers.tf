provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Apex Operational Systems Modernisation"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Tatenda Manyepa"
      Portfolio   = "Enterprise Architecture Portfolio"
      Region      = var.aws_region
    }
  }
}
