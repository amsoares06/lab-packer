## 04/17/22
- proxmox/almalinux/8
  - added template

## 07/29/21
- vcenter/centos
  - resized volumes
## 04/22/21
- vcenter/ubuntu/20.04
  - configured LVM

## 04/20/21
- got rid of version numbers, they don´t make sense atm
- vcenter/ubuntu/18.04
  - added template

## Release 1.0.5
- vcenter/centos/7
  - resized disk
- vcenter/ubuntu/20.04
  - initial release

## Release 1.0.4
- vcenter/centos/7
  - fixed DNS IP
  - fixed checksum on iso
  - changed kickstart location
  - removed install-puppet-agent.sh script
- vcenter/centos/8
  - initial release

## Release 1.0.3
- vcenter/centos/7
  - updated image url
  - removed some sensitive data from template
  - fixed identation

## Release 1.0.2
- vcenter/centos/7:
  - changed packer userid

## Release 1.0.1
- vcenter/centos/7:
  - template added
- esxi/centos/7:
  - template deprecated, keeping available only for reference

## Release 1.0.0
- Initial Release
- esxi/centos/7:
  - added LVM
  - configured several commands
  - configuring using packer user
  - installing puppet agent
- aws/ubuntu/18.04:
  - generic image for testing purposes

## Release 0.0.1
- Pre-Release
