variable "aws_region" {
  description = "the AWS geographical region in which to deploy infrastructure"
  type        = string
}

variable "aws_profile" {
  description = "the AWS profile (i.e. secret-access-key & access-key-id corresponding to some IAM user in some AWS account)"
  type        = string
}

variable "namespace" {
  description = "the namespace of the resources to be provisioned by this configuration"
  type        = string
}