variable "sg-name" {
    type    =   string
    default = "roboshop-all-aws"
}

variable "sg_description" {
  type = string
  default = "Allow TLS-Inbound traffic"

}

variable "inbound-from-port" {
  type = string
  default = 0
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}