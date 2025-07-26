provider "aws" {
  region = var.region
}

resource "aws_instance" "devops_ec2" {
  ami                    = "ami-08a6efd148b1f7504"
  instance_type          = var.instance_type
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  user_data              = file("userdata.sh")

  tags = {
    Name = "DevOpsAssignment2"
  }
}