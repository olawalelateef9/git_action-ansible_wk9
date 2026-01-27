terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

# 1. Nginx Node
resource "aws_instance" "nginx-node" {
  ami                    = "ami-03ea746da1a2e36e7"
  instance_type          = "t2.small"
  subnet_id              = "subnet-03e8a88d085ee2c50"
  vpc_security_group_ids = ["sg-06aab2abe1f311dbc"]
  key_name               = "jenkinskp"

  tags = {
    Name = "Nginx_node"
  }
}

# 2. Java Node
resource "aws_instance" "java-node" {
  ami                    = "ami-03ea746da1a2e36e7"
  instance_type          = "t2.small"
  subnet_id              = "sg-06aab2abe1f311dbc"
  vpc_security_group_ids = ["sg-0dfb7e8960e8d9c86"]
  key_name               = "jenkinskp"

  tags = {
    Name = "Java_Node"
  }
}

# 3. Ansible Server
resource "aws_instance" "ansible-server" {
  ami                    = "ami-03ea746da1a2e36e7"
  instance_type          = "t2.small"
  subnet_id              = "sg-06aab2abe1f311dbc"
  vpc_security_group_ids = ["sg-0dfb7e8960e8d9c86"]
  key_name               = "jenkinskp"

  tags = {
    Name = "Ansible_Server"
  }
}