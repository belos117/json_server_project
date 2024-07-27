variable "ami_image" {
  description = "AWS ami image"
  type        = string
  default     = "ami-04a81a99f5ec58529"
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