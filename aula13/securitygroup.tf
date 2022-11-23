
resource "aws_security_group" "sg_acesso_total_local" {

  description = "sg - security group acesso ssh somente VPC"

  ingress {
    
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["172.31.0.0/16"]

  }
  #permissão de saida da maquina, para a internet, pois se não
  #seria impossivel instalar algo nela ou dar apt-get update
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  tags = {
    "Name" = "${var.usuario}-sg-ssh-local"
  }
}

#SG de permitindo o acesso a porta 80 para toda a internet, 
#pois quem for acessar nosso front, estara na internet
resource "aws_security_group" "sg_acesso_web_publico" {
  description = "sg acesso web publico"
  #liberando a entrada pela porta 80 - HTTP
  ingress {
    description      = "HTTP"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "${var.usuario}-sg-web-publico"
  }
}

#liberando SSH(22) para a internet, mas poderia ser para o IP da sua empresa
#pois nossa VM de gerenciamento, tem que ser acessivel de fora da VPC
resource "aws_security_group" "sg_acesso_ssh_publico" {
  description = "nsg acesso ssh publico"
 
  ingress {
    description      = "SSH-mngt"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "${var.usuario}-sg-ssh-publico"
  }
}