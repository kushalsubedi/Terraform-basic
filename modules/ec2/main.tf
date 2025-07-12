
resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = var.sg_id
  key_name = "kushal"
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "This is KUSHAL" > /var/www/html/index.html
              EOF
  tags = {
    Name = var.instance_name
    Creator = var.creator_name
  }

}
