variable "ami_image" {
  description = "AWS ami image"
  type        = string
  default     = "ami-013b3de8a8fa9b39f"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "server tag"
  type        = string
  default     = "json-server"
}