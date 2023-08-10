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

variable "backend_domain" {
  type        = string
  description = "Backend domain url"
}

variable "ecs_task_role_arn" {
  type        = string
  description = "ECS task role arn"
}

variable "ecs_task_execution_role_arn" {
  type        = string
  description = "ECS execution role arn"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "ecr_repository_url" {
  type        = string
  description = "ECR repository url"
}

variable "route53_root_zone_id" {
    type        = string
    description = "Route53 root zone id"
}

variable "route53_root_domain_name" {
    type        = string
    description = "Route53 root domain name"
}

variable "acm_certificate_arn" {
    type        = string
    description = "ACM certificate arn"
}

variable "ecs_service_cpu" {
  type        = number
  description = "ecs service cpu"
}

variable "ecs_service_memory" {
  type        = number
  description = "ecs service memory"
}