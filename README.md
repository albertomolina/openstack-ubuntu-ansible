openstack-ubuntu-ansible
========================

Ansible playbooks for installing OpenStack on Ubuntu.

## Software used at this moment (specific versions):

- Ubuntu 14.04 LTS
- Linux kernel: 3.13.0-X-generic
- Open vSwitch: 2.0.2
- OpenStack: Kilo (2015.1)
- Ansible: 1.7.2

## Jumbo frames

It's assumed that the internal interface uses MTU=9000.

## OpenStack componens included:

Keystone, Glance, Nova (KVM/Qemu), Neutron (OVS with VXLAN), Cinder (LVM+iSCSI) and Heat

## All in One node

The file *groups_var/all* contains all variables needed by ansible playbooks and
they can be customized if needed. It's **mandatory** to define the following
variables according to the server's external network:

    controller_external_ip: 192.168.1.101
    storage_external_ip: 192.168.1.101
    network_node_external_ip: 192.168.1.101
    network_node_external_netmask: 255.255.255.0
    network_node_external_CIDR: 24
    external_gateway: 192.168.1.1

## Run ansible playbooks to configure the cloud

    ansible-playbook site-aio.yml -s

## Using OpenStack

Open your browser and type in the notification bar http://192.168.1.101 or the corresponding external IP chosen.

## References

- [https://github.com/openstack-ansible](https://github.com/openstack-ansible)
- [https://github.com/djoreilly/quantum-ansible](https://github.com/djoreilly/quantum-ansible)
