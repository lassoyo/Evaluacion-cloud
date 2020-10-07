provider "aws" {
    profile = "default"
    region = "us-east-1"
}

resource "aws_instance" "example" {
    key_name        = "dani-key"
    ami             = "ami-0817d428a6fb68645"
    instance_type   = "t2.micro"
    tags            = {
        Name = "terraform-evaluacion1"
        terraform = "true"
    }
    vpc_security_group_ids  = [aws_security_group.evaluacion1.id,]
    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("/home/dani/claves/dani-key.pem")
        host        = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update -y",
            "sudo apt-get install -y ca-certificates wget",
            "wget https://get.glennr.nl/unifi/install/unifi-5.13.32.sh",

        ]
        on_failure = "continue"
    }
}

