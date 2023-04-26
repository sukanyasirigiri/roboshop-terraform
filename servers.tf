data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}
  
data "aws_security_group" "allow-all" {
  name = "allow -all"
}

variable "instatnce_type"{
    default = "t3.small"
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "frontend"
  }
  
}
  resource "aws_route53_record" "frontend" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "frontend-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
 
 
  resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "cart"
  }
  }
  resource "aws_route53_record" "cart" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "cart-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}
 
 
  resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "mongodb"
  }
  }
  resource "aws_route53_record" "mongodb" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "mongodb-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}
 

  resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "catalogue"
  }
  }
   resource "aws_route53_record" "catalogue" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "catalogue-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}
 
 
  resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "redis"
  }
  }
  resource "aws_route53_record" "redis" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "redis-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}
  
  
  resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "user"
  }
  }
  resource "aws_route53_record" "user" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "user-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}
  
  
  
  resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "mysql"
  }
  }
  resource "aws_route53_record" "mysql" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "mysql-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}
  
  
  resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "shipping"
  }
  }
  resource "aws_route53_record" "shipping" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "shipping-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}
  
  
  resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "rabbitmq"
  }
  }
 resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "rabbitmq-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}
  
  
  resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id

  instance_type = var.instance_type
vpc_security_group_ids =[data.aws_securty_group.allow.id]
  tags = {
    Name = "payment"
  }
  }
  resource "aws_route53_record" "payment" {
  zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "payment-dev.devops1722.com"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}