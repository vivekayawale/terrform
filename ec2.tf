provider "aws" {
  region     = "ap-south-1"
  access_key ="AKIA5Y5HITJGGPLZN34D"
  secret_key = "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"
}

resource "aws_instance" "terraforminst" {
  ami           = "ami-0f69bc5520884278e" # ap-south-1
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "tf"
  vpc_security_group_ids = [aws_security_group.tfSG.id]
  tags = {
  	Name = "tf"
  }

}

resource "aws_key_pair" "vivek-ubuntu" {
  key_name   = "tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbY7Bt5tkZ75a8cUleYBpqgqsnzzJsgReNZLDjuJJd59v8Eoo+iV9yJiExx6ImJ8EwVf2ZeUfwFwvHCr8kKTGVNN0OB6k4Q8GGHCfjss1be695IoFjJS5iBM2bL3f9I2VbAB50fpqdXOqFMLMENURXx9aeBBBanoJhZhyvgthC1+60NrHpcMMmUtI26uUDKwYr2X6q0v+DZV3LCtpoDVgymX/3y1Hd+6J/700N883Gxax+sYsFMWNujY4Ou3bFejridYxnoJQ/JKFgsTe5ZyYA8AESfCmnwwK0DeszsDXXaEUS+Ku7Lm9iDnEMr9xZ5M7f1V3+L/0AYTPbkep3SFu9nYb6AgLKWaYS7nR6nE8iwu33XXBsCqQqvP3a8G6anPSuafQ7x2x39k1SWu63dN9DWGNN4xtPXzo4olK4GX68YOOkCKhn3p1R1VbupZnlwMOfliTGuXeMmfP/y6WlfIWbkQxEQ9zp3aS4PDhQDo+BWuMgXUjJOX7ZtmRkl9nJzgs= root@ubuntu-vivek"
}

resource "aws_eip" "eip" {
  instance = aws_instance.terraforminst.id
  vpc      = true
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "tfSG" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 
   ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "tfSG"
  }
}

