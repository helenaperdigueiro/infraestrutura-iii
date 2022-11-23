resource "aws_key_pair" "chave_terraform_aws" {
  key_name   = "${var.usuario}-terraform-aws"
  public_key = file("~/.ssh/terraform-aws.pub")
}