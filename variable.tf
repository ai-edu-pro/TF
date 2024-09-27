terraform {
  required_version = ">= 1.0.0, <2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#provider "aws" {
#  profile = "live"
#  region  = "ap-northeast-2"
#}

provider "aws" {
  alias   = "prd"
  profile = "prd"
  region  = "ap-northeast-2"
}

provider "aws" {
  alias   = "live"
  profile = "live"
  region  = "ap-northeast-2"
}