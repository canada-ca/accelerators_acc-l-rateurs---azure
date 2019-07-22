resource azurerm_availability_set demo-core-fwcore-rg__demofwcore-availabilityset {
  name                         = "${var.fwprefix}-AvailabilitySet"
  location                     = "${var.location}"
  resource_group_name          = "${var.rgname.fortigate}"
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "2"
  managed                      = "true"
  tags                         = "${var.tags}"
}

resource azurerm_network_security_group demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG {
  name                = "${var.fwprefix}-2hwmajahfzosu-NSG"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  security_rule {
    name                       = "AllowAllInbound"
    description                = "Allow all in"
    access                     = "Allow"
    priority                   = "100"
    protocol                   = "*"
    direction                  = "Inbound"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "AllowAllOutbound"
    description                = "Allow all out"
    access                     = "Allow"
    priority                   = "105"
    protocol                   = "*"
    direction                  = "Outbound"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
  tags = "${var.tags}"
}


resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-A-Nic1 {
  name                          = "${var.fwprefix}-A-Nic1"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-Outside.id}"
    private_ip_address            = "100.96.112.4"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = "${azurerm_public_ip.demo-core-fwcore-rg__DemoFWCore-A-EXT-PubIP.id}"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-A-Nic2 {
  name                          = "${var.fwprefix}-A-Nic2"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-CoreToSpokes.id}"
    private_ip_address            = "100.96.116.5"
    private_ip_address_allocation = "Static"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-A-Nic3 {
  name                          = "${var.fwprefix}-A-Nic3"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-HASync.id}"
    private_ip_address            = "100.96.116.36"
    private_ip_address_allocation = "Static"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-A-Nic4 {
  name                          = "${var.fwprefix}-A-Nic4"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-Management.id}"
    private_ip_address            = "100.96.116.68"
    private_ip_address_allocation = "Static"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-B-Nic1 {
  name                          = "${var.fwprefix}-B-Nic1"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-Outside.id}"
    private_ip_address            = "100.96.112.5"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = "${azurerm_public_ip.demo-core-fwcore-rg__DemoFWCore-B-EXT-PubIP.id}"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-B-Nic2 {
  name                          = "${var.fwprefix}-B-Nic2"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-CoreToSpokes.id}"
    private_ip_address            = "100.96.116.6"
    private_ip_address_allocation = "Static"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-B-Nic3 {
  name                          = "${var.fwprefix}-B-Nic3"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-HASync.id}"
    private_ip_address            = "100.96.116.37"
    private_ip_address_allocation = "Static"
    primary                       = true
  }
}

resource azurerm_network_interface demo-core-fwcore-rg__DemoFWCore-B-Nic4 {
  name                          = "${var.fwprefix}-B-Nic4"
  location                      = "${var.location}"
  resource_group_name           = "${var.rgname.fortigate}"
  enable_ip_forwarding          = true
  enable_accelerated_networking = false
  network_security_group_id     = "${azurerm_network_security_group.demo-core-fwcore-rg__DemoFWCore-2hwmajahfzosu-NSG.id}"
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "${data.azurerm_subnet.Demo-Management.id}"
    private_ip_address            = "100.96.116.69"
    private_ip_address_allocation = "Static"
    primary                       = true
  }
}

resource azurerm_public_ip demo-core-fwcore-rg__DemoFWCore-A-EXT-PubIP {
  name                = "${var.fwprefix}-A-EXT-PubIP"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = "${var.tags}"
}

resource azurerm_public_ip demo-core-fwcore-rg__DemoFWCore-A-MGMT-PubIP {
  name                = "${var.fwprefix}-A-MGMT-PubIP"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = "${var.tags}"
}

resource azurerm_public_ip demo-core-fwcore-rg__DemoFWCore-B-EXT-PubIP {
  name                = "${var.fwprefix}-B-EXT-PubIP"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = "${var.tags}"
}

resource azurerm_public_ip demo-core-fwcore-rg__DemoFWCore-B-MGMT-PubIP {
  name                = "${var.fwprefix}-B-MGMT-PubIP"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = "${var.tags}"
}

resource azurerm_public_ip demo-core-fwcore-rg__DemoFWCore-ELB-PubIP {
  name                = "${var.fwprefix}-ELB-PubIP"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = "${var.tags}"
}

resource azurerm_virtual_machine demo-core-fwcore-rg__DemoFWCore-A {
  name                = "${var.fwprefix}-A"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  availability_set_id = "${azurerm_availability_set.demo-core-fwcore-rg__demofwcore-availabilityset.id}"
  vm_size             = "Standard_F4"
  network_interface_ids = [
  "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-A-Nic1.id}", 
  "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-A-Nic2.id}", 
  "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-A-Nic3.id}", 
  "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-A-Nic4.id}" ]
  primary_network_interface_id     = "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-A-Nic1.id}"
  delete_data_disks_on_termination = "false"
  delete_os_disk_on_termination    = "false"
  os_profile {
    computer_name  = "${var.fwprefix}-A"
    admin_username = "fwadmin"
    admin_password = "${data.azurerm_key_vault_secret.fwpasswordsecret.value}"
    custom_data    = "${file("fwconfig/coreA.conf")}"
  }
  storage_image_reference {
    publisher = "fortinet"
    offer     = "fortinet_fortigate-vm_v5"
    sku       = "fortinet_fg-vm"
    version   = "latest"
  }
  plan {
    name      = "fortinet_fg-vm"
    publisher = "fortinet"
    product   = "fortinet_fortigate-vm_v5"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  storage_os_disk {
    name          = "${var.fwprefix}-A_OsDisk_1"
    caching       = "ReadWrite"
    create_option = "FromImage"
    os_type       = "Linux"
    disk_size_gb  = "2"
  }
  storage_data_disk {
    name          = "${var.fwprefix}-A_DataDisk_1"
    lun           = 0
    caching       = "None"
    create_option = "Empty"
    disk_size_gb  = "30"
  }
  tags = "${var.tags}"
}

resource azurerm_virtual_machine demo-core-fwcore-rg__DemoFWCore-B {
  name                = "${var.fwprefix}-B"
  location            = "${var.location}"
  resource_group_name = "${var.rgname.fortigate}"
  availability_set_id = "${azurerm_availability_set.demo-core-fwcore-rg__demofwcore-availabilityset.id}"
  vm_size             = "Standard_F4"
  network_interface_ids = [
    "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-B-Nic1.id}",
    "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-B-Nic2.id}",
    "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-B-Nic3.id}",
    "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-B-Nic4.id}"]
  primary_network_interface_id     = "${azurerm_network_interface.demo-core-fwcore-rg__DemoFWCore-B-Nic1.id}"
  delete_data_disks_on_termination = "false"
  delete_os_disk_on_termination    = "false"
  os_profile {
    computer_name  = "${var.fwprefix}-B"
    admin_username = "fwadmin"
    admin_password = "${data.azurerm_key_vault_secret.fwpasswordsecret.value}"
    custom_data    = "${file("fwconfig/coreB.conf")}"
  }
  storage_image_reference {
    publisher = "fortinet"
    offer     = "fortinet_fortigate-vm_v5"
    sku       = "fortinet_fg-vm"
    version   = "latest"
  }
  plan {
    name      = "fortinet_fg-vm"
    publisher = "fortinet"
    product   = "fortinet_fortigate-vm_v5"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  storage_os_disk {
    name          = "${var.fwprefix}-B_OsDisk_1"
    caching       = "ReadWrite"
    create_option = "FromImage"
    os_type       = "Linux"
    disk_size_gb  = "2"
  }
  storage_data_disk {
    name          = "${var.fwprefix}-B_DataDisk_1"
    lun           = 0
    caching       = "None"
    create_option = "Empty"
    disk_size_gb  = "30"
  }
  tags = "${var.tags}"
}
