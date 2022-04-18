packer {
  required_plugins {
    proxmox = {
      version = " >= 1.0.1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "packer-almalinux8" {
  # Proxmox host
  proxmox_url              = "${var.proxmox_url}"
  username                 = "${var.username}"
  password                 = "${var.password}"
  node                     = "proxmox01"
  insecure_skip_tls_verify = true

  # VM settings
  vm_name         = "packer-almalinux8"
  vm_id           = 901
  cores           = 1
  sockets         = 1
  memory          = 1024
  os              = "l26"
  qemu_agent      = true
  scsi_controller = "virtio-scsi-pci"

  disks {
    type      = "scsi"
    disk_size = "30G"
    #storage_pool      = "local-lvm"
    storage_pool      = "hdd"
    storage_pool_type = "lvm-thin"
    format            = "raw"
  }

  network_adapters {
    bridge   = "vmbr0"
    model    = "virtio"
    firewall = true
  }

  # ISO settings
  # iso_url      = "http://nl.mirrors.clouvider.net/almalinux/8.5/isos/x86_64/AlmaLinux-8.5-x86_64-dvd.iso"
  # iso_checksum = "sha256:54b8881bebd924e4699ed12634187a82156fdb0fa57ec24058d04d70d2f033b3"
  iso_file         = "local:iso/AlmaLinux-8.5-x86_64-dvd.iso"
  iso_storage_pool = "local"
  unmount_iso      = true

  # OS Installation
  http_directory = "proxmox/almalinux/8/http"
  boot_wait      = "20s"
  boot_command = [
    "<tab> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg<enter><wait>"
  ]
  ssh_username           = "${var.ssh_username}"
  ssh_password           = "${var.ssh_password}"
  ssh_timeout            = "30m"
  ssh_pty                = true
  ssh_handshake_attempts = 20

  # Template settings
  template_name        = "packer-almalinux8"
  template_description = "packer generated almalinux8"
}

build {
  sources = ["source.proxmox-iso.packer-almalinux8"]

  provisioner "file" {
    source      = "files/linux/authorized_keys"
    destination = "/home/packer/.ssh/authorized_keys"
  }

  provisioner "shell" {
    execute_command = "sudo -E sh -x '{{.Path}}'"
    inline = [
      "chmod 600 /home/packer/.ssh/authorized_keys"
    ]
  }
  provisioner "shell" {
    execute_command = "sudo -E sh -x '{{.Path}}'"
    scripts = [
      "scripts/linux/update-system.sh"
    ]
  }
}
