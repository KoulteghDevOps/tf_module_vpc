locals {
    all_private_subnet_ids = concat(module.subnets["webserver"].route_table_ids,module.subnets["application"].route_table_ids,module.subnets["database"].route_table_ids)
}