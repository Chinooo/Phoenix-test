variable "access_key" {}
variable "secret_key" {}
variable "ssh_key_name" {}

variable "region" {
    default = "us-west-2"
}

variable "subnet_id" {
    default = "	subnet-ce013bb8"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_name" {
    default = "testui"
}

variable "ami" {
    default = "ami-6e1a0117"
}

variable "key_name" {
    default = "Hum_do"
}
