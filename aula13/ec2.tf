resource "aws_instance" "helena_ec2_k8s" {
  count         = 3
  ami           = var.ami
  instance_type = var.tipo_instancia_kubernetes
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-k8s${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.sg_acesso_total_local.id}","${aws_security_group.sg_acesso_ssh_publico.id}", "${aws_security_group.sg_acesso_web_publico.id}"]
}

resource "aws_instance" "helena_ec2_ansible" {
  count         = 1
  ami           = var.ami
  instance_type = var.tipo_instancia
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-ansible${count.index}"
  }
    vpc_security_group_ids = ["${aws_security_group.sg_acesso_total_local.id}","${aws_security_group.sg_acesso_ssh_publico.id}" ]
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
  EOF  
}