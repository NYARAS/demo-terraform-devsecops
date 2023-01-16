variable "region" {
  description = "Region to create the AWS resources"
  default     = "eu-west-1"
}

variable "instance_key_name" {
  default = "golang-mux-api-devops-bastion"
}
