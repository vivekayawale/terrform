
     #@____RESOURCE_FILE____@#

provider "aws" {
  region     = "ap-south-1"
  access_key = var.vivek_AK
  secret_key = var.vivek_SK
}


   #INSTANCE1#

resource "aws_instance" "terraforminst1" {
  ami           = var.ami1 # ap-south-1
  instance_type = var.typ1
  availability_zone = var.AZ1
  key_name = var.key1
  vpc_security_group_ids = [aws_security_group.tfSG.id]
  tags = {
        Name = "inst1"
  }

}

   #INSTANCE2#

resource "aws_instance" "terraforminst2" {
  ami           = var.ami2 # ap-south-1
  instance_type = var.typ1
  availability_zone = var.AZ2
  key_name = var.key1
  vpc_security_group_ids = [aws_security_group.tfSG2.id]
  tags = {
        Name = "inst2"
  }

}


   #INSTANCE3#

resource "aws_instance" "terraforminst3" {
  ami           = var.ami3 # ap-south-1
  instance_type = var.typ1
  availability_zone = var.AZ3
  key_name = var.key1
  vpc_security_group_ids = [aws_security_group.tfSG2.id]
  tags = {
        Name = "inst3"
  }

}


   #KEY#

resource "aws_key_pair" "vivek-ubuntu" {
  key_name   = "tfkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDuQTcsSWV9vjfeiSdwie8+uYp5UO6MEMYYZ6KqkKuIJkdWuG3UCn4pBgVx6hVILCa3QeXRhhJSA3VOLr9Y1+RGpVN+atw71IkSGOSQ2KKkU/pa1kn+mShHGJUPxloiAz8GeDDFRsvtLZehQ24fzChowpFyF5y71uraKzPZ8TrQW3gzZFpBXIEMJWOCUGa8HrVOfk6UKS8nAZfDHQ/ILZfrllGHGXXC7tGovc9ZqRAKltOuRI4ZKm1dvCKD8ruNlCsdnKVdGlKnx54vDOAmNTe/I+feAzizP0mcNVCT1nLbKBOoqsmBHW2eMlS/cJAbN/TKhtbrapCAwWfkDubCLg1A8jfXDz+NM/82gSAOfud4xO6wkXvxt5UOxlo2+dl5/lkcJExfVcH7sqVkeM60R6rRvAlrNGyW+4DUDljqcErqW1qZQ+k0qNDvBDkzReRyCTvuS3qrt5spTJtW5QedD6ueK30igwheFxfm2paUGWbzp2ycZqqD5eaMrAjrMfy7pB0= root@vivek-VirtualBox"
}


    #VPC#

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


    #SECURITY_GROUP-1#

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


   #SECURITY_GROUP-2#

resource "aws_security_group" "tfSG2" {
  name        = "allow_tls2"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
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
    Name = "tfSG2"
  }
}

