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
  default = "193.11.184.0/24"
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
    default = "vpc-067aa258a02d4a873"
}