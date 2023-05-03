
resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id

  instance_type = each.value["instance_type"]
vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
  tags = {
    Name = each.value["name"]
  }
  

   provisioner "remote-exec" {

   

connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.private_ip
  }

  
    inline = [
     "rm -rf roboshop-shell",
      "gitclone https://github.com/raghudevopsb72/roboshop-shell.git",
      "cd roboshop-shell",
      "sudo bash ${each.value["name"]}.sh"
    ]
}
}

  resource "aws_route53_record" "frontend" {
    for_each = var.components
   zone_id = "Z0505887K8AY7Z6S40DR"
  name    = "${each.value["name"]}-dev.devops1722.com"
   type    = "A"
  ttl     = 30
   records = [aws_instance.instance[each.value["name"]].private_ip]
}
 
 
  