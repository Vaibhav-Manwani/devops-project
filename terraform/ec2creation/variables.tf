#used to define variable that can be used oin tha main file

variable "ec2_class" {
  default = "t2.micro"
  type    = string
}

variable "root_storage" {
  default = 15
  type    = number
}

variable "ami_id" {
  default = "ami-075686beab831bb7f"
  type = string
}

variable "env" {
  default = "prod"
  type = string
}
