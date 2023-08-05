variable "ecs_name" {
  type        = string
  description = "Name of this ecs service"
}

variable "service" {
  type        = string
  description = "service name"
}

variable "environment" {
  type        = string
  description = "service environment"
}

variable "backend_port" {
  type        = number
  description = "service port"
  default = 8000
}

variable "region" {
  type        = string
  description = "Region of the AWS services"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID used by this environment"
}

variable "public-subnet-ids" {
  type        = list(string)
  description = "Public subnet ids for ELB"
}

variable "private_cidr" {
  type        = list(string)
  description = "CIDR used by private subnet of this environment"
}

variable "nat-a-id" {
  type        = string
  description = "NAT ID for zone a"
}

variable "nat-c-id" {
  type        = string
  description = "NAT ID for zone c"
}