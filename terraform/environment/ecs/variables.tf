variable "environment" {}
variable "region" {}
variable "tf_state_bucket" {}
variable "tf_remote_state_file" {}
variable "created_By" {}

variable "cluster_name" {
  type        = string
  description = "The name of AWS ECS cluster"
}

variable "key_name" {
  type        = string
  description = "The name for ssh key, used for aws_launch_configuration"
}