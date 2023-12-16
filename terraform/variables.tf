variable "region" {
  type = string
  default = "us-east-1"
}

variable "zone" {
  type = map(any)
  default = {
    a = "us-east-1a"
  }
}

variable "myip" {
  type = string
  default = "myip"
}

variable "amis" {
  type = map(any)
  default = {
    us-east-1 = "ami-0fc5d935ebf8bc3bc"
  }
}

variable "user" {
    type = string
    default = "ubuntu"
}

variable "vpc_id" {
    type = string
    default = "myvpc"
}