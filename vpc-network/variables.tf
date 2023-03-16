variable "cidr_vpc" {
  description = "Definition of Cidr block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_subnet" {
  description = "Definition of Cidr block for Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "cidr_private_subnet" {
  description = "Definition Cidr block for subnet private"
  type        = string
  default     = "10.0.2.0/24"
}

variable "environment" {
  description = "Identification of environment where the resource will be used"
  type        = string
}

variable "zone" {
  description = "Zone of AWS"
  type        = string
  default     = "us-east-2"
}

variable "protocol_sg" {
  description = "Value type of protocol for security-group"
  type        = string
  default     = "tcp"
}

variable "port_sg" {
  description = "value of port for security-group"
  type        = number
  default     = 22
}
