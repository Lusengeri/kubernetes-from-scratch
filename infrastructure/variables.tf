variable "aws_region" {
  description = "The AWS geographical region in which to deploy infrastructure"
  type = string
}

variable "aws_profile" {
  description = "The AWS profile (i.e. secret-access-key & access-key-id corresponding to some IAM user in some AWS account)"
  type = string 
}