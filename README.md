openstack-ubuntu-ansible
========================

Ansible playbooks for installing OpenStack on Ubuntu.

These playbooks have been written in the hope of using them in a real deployment
with physical servers, but thay can be used too to deploy a OpenStack test
environment with vagrant inside a computer.

## Software used at this moment (specific versions):

- Ubuntu 14.04 LTS
- Linux kernel: 3.13.0-74-generic
- Open vSwitch: 2.0.2
- OpenStack: Kilo (2015.1)
- Ansible: 1.7.2
- Vagrant: 1.6.5
- VirtualBox: 4.3.14

## OpenStack componens included:

Keystone, Glance, Nova (KVM/Qemu), Neutron (OVS), Cinder (LVM+iSCSI) and Heat

## [OPTIONAL] Get a ubuntu trusty vagrant box:

Tested using the ubuntu "official" vagrant box available at:

    https://atlas.hashicorp.com/ubuntu/boxes/trusty64

You can download and install it locally with:

    vagrant box add ubuntu/trusty64

If you are going to use these playbooks with a physical server, ignore the
Vagranfile and configure ansible.cfg properly.

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

In the case you're using vagrant, the Vagranfile must be modified properly:

    controller.vm.network :public_network, bridge: "wlan0" ,ip: "192.168.1.101" # eth2 external

## Bring up the scenario

    chmod 400 vagrant_private_key
    vagrant up

## Run ansible playbooks to configure the cloud

    ansible-playbook site-aio.yml -s

## Using OpenStack

Open your browser and type in the notification bar http://192.168.1.101 or the corresponding external IP chosen.

## References

- [https://github.com/openstack-ansible](https://github.com/openstack-ansible)
- [https://github.com/djoreilly/quantum-ansible](https://github.com/djoreilly/quantum-ansible)
