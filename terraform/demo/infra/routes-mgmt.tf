resource azurerm_route_table demo-core-netmgmt-rg__Demo-MGMT-APP-RT {
  name                = "Demo-MGMT-APP-RT"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.Demo-Core-NetMGMT-RG.name}"
  route {
    name           = "local-Subnet"
    address_prefix = "100.96.122.0/24"
    next_hop_type  = "VnetLocal"
  }
  route {
    name                   = "Demo-MGMT-VNET"
    address_prefix         = "100.96.120.0/21"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "Demo-Management"
    address_prefix         = "100.96.116.64/27"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "Demo-Core-VNET"
    address_prefix         = "100.96.112.0/21"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  tags = "${var.tags}"
}
resource azurerm_route_table demo-core-netmgmt-rg__Demo-MGMT-DB-RT {
  name                = "Demo-MGMT-DB-RT"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.Demo-Core-NetMGMT-RG.name}"
  route {
    name           = "local-Subnet"
    address_prefix = "100.96.124.0/24"
    next_hop_type  = "VnetLocal"
  }
  route {
    name                   = "Demo-MGMT-VNET"
    address_prefix         = "100.96.120.0/21"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "Demo-Management"
    address_prefix         = "100.96.116.64/27"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "Demo-Core-VNET"
    address_prefix         = "100.96.112.0/21"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  tags = "${var.tags}"
}
resource azurerm_route_table demo-core-netmgmt-rg__Demo-MGMT-PAZ-RT {
  name                = "Demo-MGMT-PAZ-RT"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.Demo-Core-NetMGMT-RG.name}"
  route {
    name           = "local-Subnet"
    address_prefix = "100.96.120.0/24"
    next_hop_type  = "VnetLocal"
  }
  route {
    name                   = "Demo-MGMT-VNET"
    address_prefix         = "100.96.120.0/21"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "Demo-Management"
    address_prefix         = "100.96.116.64/27"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "Demo-Core-VNET"
    address_prefix         = "100.96.112.0/21"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  route {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "100.96.116.4"
  }
  tags = "${var.tags}"
}
