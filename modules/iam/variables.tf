variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN del bucket S3 de imagenes"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN de la cola SQS principal"
  type        = string
}