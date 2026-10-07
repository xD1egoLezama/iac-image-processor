terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Módulo Network (ajustado a las variables que maneja tu módulo)
module "network" {
  source      = "../../modules/network"
  environment = "prod"
}

module "security" {
  source      = "../../modules/security"
  environment = "prod"
  vpc_id      = module.network.vpc_id
}

module "s3" {
  source      = "../../modules/s3"
  environment = "prod"
}

module "sqs" {
  source      = "../../modules/sqs"
  environment = "prod"
}

module "iam" {
  source        = "../../modules/iam"
  environment   = "prod"
  s3_bucket_arn = module.s3.bucket_arn
  sqs_queue_arn = module.sqs.queue_arn
}

module "lambda" {
  source             = "../../modules/lambda"
  environment        = "prod"
  role_arn           = module.iam.lambda_role_arn
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.security.lambda_security_group_id]
  s3_bucket_name     = module.s3.bucket_name
  sqs_queue_arn      = module.sqs.queue_arn
}

# Módulo API Gateway (sin la variable environment)
module "api_gateway" {
  source               = "../../modules/api_gateway"
  environment          = "prod"
  lambda_function_arn  = module.lambda.function_arn
  lambda_function_name = module.lambda.function_name
}

module "monitoring" {
  source               = "../../modules/monitoring"
  environment          = "prod"
  lambda_function_name = module.lambda.function_name
  sqs_dlq_name         = "sqs-image-dlq-prod"
}