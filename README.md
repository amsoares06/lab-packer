# lab-packer
Creates a packer image to deploy on AWS or ESXi.

## How to start
Git clone this repository, all paths are relative to the base directory of this repository.

## How to setup
Create a json file with credentials. For AWS this is optional, you can skip this if you have AWS CLI configured.

#### AWS (vars/aws-vars.json):
```json
{
    "aws_access_key": "<AWS ACCESS KEY>",
    "aws_secret_key": "<AWS SECRET KEY>",
    "aws_region": "<AWS REGION>"
}
```

#### ESXi (vars/esxi-vars.json):
```json
{
    "username": "packer",
    "password": "packer",
    "esxi_host": "<ESXi IP>",
    "esxi_username": "<ESXi USER>",
    "esxi_password": "<ESXi PASSWORD>"
}
```
#### vCenter (vars/vcenter-vars.json):
```json
{
    "vcenter_server": "<VCENTER_ADDRESS>",
    "vcenter_username": "<VCENTER_USER>",
    "vcenter_password": "<VCENTER_PASSWORD>",
    "vcenter_insecure_connection": "<false|true>",
    "vcenter_datacenter": "<DATACENTER>",
    "vcenter_cluster": "<CLUSTER>",
    "vcenter_datastore": "<DATASTORE>"
}
```

## How to use
Run packer from the base folder of this repository.

```
packer validate -var-file=vars/vcenter-vars.json vcenter/centos/7/vcenter-centos7.json
packer build -var-file=vars/vcenter-vars.json vcenter/centos/7/vcenter-centos7.json
```

Alternatively you can set a parameter as a environment variable:
```json
{
    (...)
    "vcenter_password": "{{ env `PACKER_VSPHERE_PASSWORD` }}",
    (...)
}
```
Export vSphere password and call Packer:
```
export PACKER_VSPHERE_PASSWORD="<PASSWORD>"
packer validate -var-file=vars/vcenter-vars.json vcenter/centos/7/vcenter-centos7.json
packer build -var-file=vars/vcenter-vars.json vcenter/centos/7/vcenter-centos7.json
```

## How to use templates in HCL
Example:
```
packer init proxmox/almalinux/8
packer validate proxmox/almalinux/8
export PKR_VAR_password="<PASSWORD>"
packer buil proxmox/almalinux/8
```

## Output
An image will be created, AMI for AWS or OVA for ESXi ready to be used.
A template will be generated for vCenter.

## OBS:
The `vsphere-iso` provider does not cleanup `packer_cache` folder, remove it manually if desired.
