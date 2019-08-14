variable "vnet_address_space" {
  default = [
    "10.0.0.0/16",
    "10.1.0.0/16",
  ]
}
variable "subnet_address_prefix" {
  default = [
     "10.0.0.0/24",
	"10.1.0.0/24",
	"10.0.1.0/24",
	"10.1.1.0/24",
  ]
}