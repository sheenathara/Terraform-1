# variable "AWS_ACCESS_KEY_ID" {}
# variable "AWS_SECRET_ACCESS_KEY" {}
variable "type" {
  type        = string
  description = "AWS Region required by Terraform AWS Provider"
  default     = "t2.nano"
  }
