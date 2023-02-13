output "sgs" {
  value = {
    alb_sg     = aws_security_group.alb_sg.id
    cluster_sg = aws_security_group.cluster_sg.id
  }
}