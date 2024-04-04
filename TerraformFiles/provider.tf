#STEP1: DEFINE AWS VERSION
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.43.0"
    }
  }
}
#STEP2: DEFINE THE REGION 
provider "aws" {
  region = "eu-west-2"
}
