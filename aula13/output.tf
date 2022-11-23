output "instancia_ec2_k8s_publico" {
  value = aws_instance.helena_ec2_k8s.*.public_ip
}

output "instancia_ec2_k8s_private" {
  value = aws_instance.helena_ec2_k8s.*.private_ip
}

output "instancia_ec2_ansible" {
  value = aws_instance.helena_ec2_ansible.*.public_ip
}