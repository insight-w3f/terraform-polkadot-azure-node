variable "create" {
  description = "Bool to create the resources"
  type        = bool
  default     = true
}

#####
# Azure
#####
variable "azure_resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

########
# Label
########
variable "environment" {
  description = "The environment"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = ""
}

variable "stage" {
  description = "The stage of the deployment"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "The network name, ie kusama / mainnet"
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
  default     = ""
}

#####
# instance
#####
variable "node_name" {
  description = "Name of the node"
  type        = string
  default     = "node"
}

variable "public_key_path" {
  description = "The path to the public ssh key"
  type        = string
}

variable "key_name" {
  description = "The name of the preexisting key to be used instead of the local public_key_path"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "Standard_A2_v2"
}

#########
# Network
#########
variable "create_eip" {
  description = "Boolean to create elastic IP"
  type        = bool
  default     = false
}

variable "public_subnet_id" {
  description = "The id of the subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "The id of the subnet."
  type        = string
}

variable "application_security_group_id" {
  description = "The id of the application security group to run in"
  type        = string
}

variable "network_security_group_id" {
  description = "The id of the network security group to run in"
  type        = string
}
