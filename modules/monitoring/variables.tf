variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la funcion Lambda a monitorear"
  type        = string
}

variable "sqs_dlq_name" {
  description = "Nombre de la Dead Letter Queue SQS a monitorear"
  type        = string
}