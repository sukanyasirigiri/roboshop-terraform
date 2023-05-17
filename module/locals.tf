locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf roboshop-shell",
      "git clone https://github.com/sukanyasirigiri/roboshop-shell",
      "cd roboshop-shell",
      "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
   "sudo labauto ansible",
    "ansible-pull -i localhost, -u https://github.com/sukanyasirigiri/roboshop-ansible -e env=${var.env} -e role_name=${var.component_name}"
    
  ]
  db_tags = {
    Name = "${var.component_name}-${var.env}"
  }
  app_tags = {
    Name    = "${var.component_name}-${var.env}"
    Monitor = "true"
  }
}