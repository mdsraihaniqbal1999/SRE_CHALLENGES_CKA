
#EKS clusters variables
variable "kubernetes_version" {
  default     = "1.30"
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "aws_region" {
  default     = "eu-west-1"
  description = "aws region"
}
