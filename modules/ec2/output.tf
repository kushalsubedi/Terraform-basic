output "public_ip" {
  value = aws_instance.ec2.public_ip
}
output "instance_arn" {
  value = aws_instance.ec2.arn
}
