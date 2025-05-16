
#first we need to create key pair for instance 
resource "aws_key_pair" "deployer" {
  key_name   = "dev-key"
  public_key = file("dev-key.pub")
}

#now we need to create security group for instance
resource "aws_security_group" "devops-sg" {
  name        = "devops-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-08007e06d4d4bd5c2"

  tags = {
    Name = "allow_tls"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "project-servers" {
  
  #count           = 3  #meta argument used to increase count but doesn't change the name of instance
  for_each = tomap({         # another meta argument used to create instance. Kinda like a loop. You use tomap({}) with dictionary and toset([]) for a list of objects
    jenkins-server = "t2.medium"
  })
  ami             = var.ami_id
  instance_type   = each.value
  user_data = file("install-jenkins.sh")
  subnet_id = "subnet-0e6935b35f2aef7ac"
  vpc_security_group_ids = [ aws_security_group.devops-sg.id ]
  key_name        = aws_key_pair.deployer.key_name
  root_block_device {
    volume_size = var.env == "prod" ? 30 : var.root_storage #conditional statement in terraform
    volume_type = "gp3"
  }
  depends_on = [ aws_security_group.devops-sg, aws_key_pair.deployer ]  #another meta argument to declare the order in which resources must be created
  tags = {
    Name = each.key
  }


}
