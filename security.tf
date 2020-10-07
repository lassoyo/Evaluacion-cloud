resource "aws_security_group" "evaluacion1" {
    name = "evaluacion1"
    vpc_id  =  "vpc-04ad5379"
    ingress {
        description = "abre todos los puertos de salida"
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks =   ["0.0.0.0/0"]
    }
    egress {
        description = "abre todos los puertos de entrada"
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks =   ["0.0.0.0/0"]

    }
}
