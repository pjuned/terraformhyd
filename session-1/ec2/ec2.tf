resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9" #devops-practice

  instance_type = "t3.micro"
  vpc_security_group_ids    =   [aws_security_group.roboshop-all.id]

  tags =    {
    Name = "HelloTerraform"
  }
}

  resource "aws_security_group" "roboshop-all" {  
    name        = var.sg-name  
    description = "Allow TLS-Inbound traffic"  
  #vpc_id      = aws_vpc.my_vpc.id  

  ingress {  
    #descripton  = "allow all ports"
    from_port   = var.inbound-from-port #means all ports 
    to_port     = 0
    protocol    = "tcp"  
    cidr_blocks  = var.cidr_blocks  # Allow HTTP traffic from anywhere  
  }  

   egress {  
    from_port   = 0  
    to_port     = 0  
    protocol    = "-1"  # Allow all outbound traffic  
    cidr_blocks  = ["0.0.0.0/0"]  
  }  

  tags  =   {
    Name    =   "roboshop-all-aws"
  }

  
}
