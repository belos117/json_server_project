resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "server_instance" {
  ami           = var.ami_image
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIcctmrmFIR2zlAgkoGvIa3Lu3VhsGU+HSXZbfqjygzJSgFsKunColPS7hnWpG4oMpW26GT+RI2KqyY3u622MCizwsyZNAWOlZHju47nzzfyveg1I4YVepbdoaeXc3GYz4RPKnn19PiXRdtWGr2LSatT3pTgsZxitM4DvTrLYwJbHtyPoQzRUbozahXFbAllhVE3MOHWQZapbNb5x+DC6NVPbjICl2CBDQSDBs6cFLzzrKO5MtWwpcYxe85UnhIz663zeBGixVyddLuKe2ukRgrKd2xX6reMHhz87h06Q1b87lnayrejh8BNSv4FH3nYGvz3Nx3J7K1IlXIQhwyrhC72htpbY4CE1ulEY1Yb4AWshiEi+P7XD4URk13ff6d9Gpy3Tp9DCaQIms5HmfvS9WZTtc/unxn49glcbnzB+ADEOwFPQfGgwCymzZ6gR2qolkMFI7wVMjNFjTrrisLNpzmKarU02aC9oycKR1KsUsBTg7HY8sNL+bRyXId1sa6rs= henkel@henkel-IdeaPad-3-15ALC6"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_port_443" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_port_80" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_port_8080" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "allow_port_22" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}