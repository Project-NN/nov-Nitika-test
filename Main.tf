provider"aws"{
  region="us-east-2"
}


variable "image" {
  type = string
  default = "ami-0603cbe34fd08cb81"
  description = "Enter your APP Image to be deployed"
}

variable "hw" {
  type = string
  default = "t2.micro"
  description = "Enter your hardware model"
}

variable "name" {
  type = string
  default = "Nitik-server1"
  description = "Enter your server name"
}



resource "aws_instance" "myawsserver" {
  ami = var.image
  instance_type = var.hw

  tags = {
    Name = var.name
    Env = "prod"
    Owner = "Nitika"
  }
}




output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "myserver-PrivateIP" {
  value = aws_instance.myawsserver.private_ip
}
