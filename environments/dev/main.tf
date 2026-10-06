terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source      = "../../modules/network"
  environment = "dev"
}

module "security" {
  source      = "../../modules/security"
  vpc_id      = module.network.vpc_id
  environment = "dev"
}

module "sqs" {
  source      = "../../modules/sqs"
  environment = "dev"
}

module "s3" {
  source      = "../../modules/s3"
  environment = "dev"
}

module "iam" {
  source        = "../../modules/iam"
  environment   = "dev"
  s3_bucket_arn = module.s3.bucket_arn
  sqs_queue_arn = module.sqs.queue_arn
}