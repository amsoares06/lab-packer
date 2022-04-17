variable "proxmox_url" {
  type        = string
  description = "Proxmox URL"
  default     = "https://192.168.15.5:8006/api2/json"
}

variable "username" {
  type        = string
  description = "Proxmox User Name"
  default     = "root@pam"
}

variable "password" {
  type        = string
  description = "Proxmox User Password"
  sensitive   = true
}

variable "node" {
  type        = string
  description = "Proxmox node"
  default     = "proxmox01"
}

variable "ssh_username" {
  type        = string
  description = "SSH User"
  default     = "packer"
}

variable "ssh_password" {
  type        = string
  description = "SSH Password"
  default     = "packer"
}
