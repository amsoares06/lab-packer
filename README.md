# lab-packer
Creates a packer image to deploy on AWS or ESXi.

## How to start
Git clone this repository, all paths are relative to the base directory of this repository.

## How to setup
Create a json file with credentials. For AWS this is optional, you can skip if you have AWS CLI configured.

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
    "username": "packer",
    "password": "packer",
    "vcenter_server": "<VCENTER IP>",
    "vcenter_username": "<VCENTER USER>",
    "vcenter_password": "<VCENTER PASSWORD>"
}
```


## How to use
Run packer from the base folder of this repository.

```
packer validate -var-file=vars/esxi-vars.json esxi/centos/7/esxi-centos7.json
packer build -var-file=vars/esxi-vars.json esxi/centos/7/esxi-centos7.json
```

## Output
An image will be created, AMI for AWS or OVA for ESXi ready to be used.

## OBS:
The `vsphere-iso` provider does not cleanup `packer_cache` folder, remove it manually if desired.
