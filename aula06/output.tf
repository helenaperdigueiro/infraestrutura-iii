output "instancia_ec2" {
  value = aws_instance.helena_ec2.*.public_ip
}