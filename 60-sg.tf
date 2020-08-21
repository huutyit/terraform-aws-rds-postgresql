# sg

#
# Security group resources
#
resource "aws_security_group" "postgresql" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name = var.name,
    },
    var.tags
  )
}
