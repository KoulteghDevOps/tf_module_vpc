resource "aws_subnet" "main" {
  count = length(var.cidr_block)
  vpc_id     = var.vpc_id          #aws_vpc.main.id
  cidr_block = var.cidr_block[count.index]  #"10.0.0.0/24"

  tags = merge(var.tags, {Name = "${var.env}-${var.name}-subnet-${count.index+1}"})
}