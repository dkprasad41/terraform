variable "access_key" {
  type = string
  default = "AKIAVMXLJU4VFIVIQWVF"
}

variable "secret_key" {
  type = string
  default = "dYtc3X7rjULMIcaS9efdLMadc8+6M74rgyqhbu3T"
}

variable "region" {
  type = string
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
  default = "ami-0533f2ba8a1995cf9"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}


variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}

