variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN de la funcion Lambda a integrar"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la funcion Lambda a integrar"
  type        = string
}