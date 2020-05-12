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

#########
# Ansible
#########
variable "private_key_path" {
  description = "The path to the private ssh key"
  type        = string
  default     = ""
}

variable "node_exporter_user" {
  description = "User for node exporter"
  type        = string
  default     = "node_exporter_user"
}

variable "node_exporter_password" {
  description = "Password for node exporter"
  type        = string
  default     = "node_exporter_password"
}

variable "polkadot_client_url" {
  description = "URL to Polkadot client binary"
  type        = string
  default     = "https://github.com/w3f/polkadot/releases/download/v0.7.32/polkadot"
}

variable "polkadot_client_hash" {
  description = "SHA256 hash of Polkadot client binary"
  type        = string
  default     = "c34d63e5d80994b2123a3a0b7c5a81ce8dc0f257ee72064bf06654c2b93e31c9"
}

variable "node_exporter_url" {
  description = "URL to Node Exporter binary"
  type        = string
  default     = "https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz"
}

variable "node_exporter_hash" {
  description = "SHA256 hash of Node Exporter binary"
  type        = string
  default     = "b2503fd932f85f4e5baf161268854bf5d22001869b84f00fd2d1f57b51b72424"
}

variable "chain" {
  description = "Which Polkadot chain to join"
  type        = string
  default     = "kusama"
}

variable "project" {
  description = "Name of the project for node name"
  type        = string
  default     = "project"
}

variable "telemetry_url" {
  description = "WSS URL for telemetry"
  type        = string
  default     = "wss://mi.private.telemetry.backend/"
}

variable "logging_filter" {
  description = "String for polkadot logging filter"
  type        = string
  default     = "sync=trace,afg=trace,babe=debug"
}

variable "relay_node_ip" {
  description = "Internal IP of Polkadot relay node"
  type        = string
  default     = ""
}

variable "relay_node_p2p_address" {
  description = "P2P address of Polkadot relay node"
  type        = string
  default     = ""
}