variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "role_arn" {
  description = "ARN del rol IAM para la funcion Lambda"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets privadas donde se ejecutara la Lambda"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de IDs de Security Groups asignados a la Lambda"
  type        = list(string)
}

variable "s3_bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN de la cola SQS principal"
  type        = string
}