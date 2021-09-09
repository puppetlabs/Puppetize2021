variable "cidr" {
    description = "The CIDR block (0.0.0.0/0) for the VPC."
    default = "10.253.252.0/24"
}

variable "region" {
    description = "The Azure location to build in."
    default = "centralus"
}

variable "subscription_id" {
    description = "Azure Subscription ID"
    default = ""
}
variable "client_id" {
    description = "Azure Client ID"
    default = ""
}
variable "client_secret" {
    description = "Azure Client Secret"
    default = ""
}
variable "tenant_id" {
    description = "Azure Tenant ID"
    default = ""
}

variable "ssh_key" {
    description = "Azure VM SSH public key"
    default = ""
}

variable "vm_name" {
    description = "The name of the VM"
    default = ""
}

variable "role" {
    description = "The puppet role"
    default = ""
}

variable "environment" {
    description = "The puppet environment"
    default = "production"
}