variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "frontend_target_group_arn" {
  type = string
}

variable "backend_target_group_arn" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "alb_sg_id" {
  type = string
}
