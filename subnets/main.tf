resource "aws_subnet" "main" {
  count = length(var.cidr_block)
  vpc_id     = var.vpc_id          #aws_vpc.main.id
  cidr_block = var.cidr_block[count.index]  #"10.0.0.0/24"
  availability_zone = var.azs[count.index]

  tags = merge(var.tags, {Name = "${var.env}-${var.name}-subnet-${count.index + 1}"})
}

resource "aws_route_table" "main" {
  count = length(var.cidr_block)
  vpc_id = var.vpc_id

  tags = merge(var.tags, {Name = "${var.env}-${var.name}-routetable-${count.index + 1}"})
}

resource "aws_route_table_association" "associatn" {
  count = length(var.cidr_block)
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.main[count.index].id
}

