variable "vpc_id" {
  description = "ID de la VPC donde se crearan los Security Groups"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}