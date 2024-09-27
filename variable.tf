terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
      configuration_aliases = [ aws, aws.dr ]
    }
  }
}

provider "aws" {
  region = var.main_region  
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "default"
  allowed_account_ids = [var.account_id]
}

provider "aws" {
  alias = "dr"
  region = var.dr_region  
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "default"
  allowed_account_ids = [var.account_id]
}