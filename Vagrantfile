# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|  
  config.vm.define :controller do |controller|
    controller.vm.box = "ubuntu/xenial64"
    controller.vm.hostname = "controller"
    controller.vm.network :private_network, ip: "192.168.221.101" # eth1 internal
    controller.vm.network :public_network, bridge: "br0" ,ip: "192.168.1.241" # eth2 external
    controller.vm.provider "virtualbox" do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", "4096"]
      vbox.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"] # eth2
      # vbox.customize ["createhd",
      #                 '--filename', "tmp/disk",
      #                 '--size', "4000" ]
      # vbox.customize ['storageattach', :id,
      #                '--storagectl', 'SATA Controller',
      #                '--port', 1,
      #                '--device', 0,
      #                '--type', 'hdd',
      #                '--medium', "tmp/disk.vdi"]
    end
  end
  # config.vm.define :compute do |compute|
  #   compute.vm.box = "ubuntu/trusty64"
  #   compute.vm.hostname = "compute"
  #   compute.vm.network :private_network, ip: "192.168.221.102" # eth1 internal
  #   compute.vm.network :public_network, bridge: "eth1" ,ip: "192.168.1.242" # eth2 external
  #   compute.vm.provider "virtualbox" do |vbox|
  #     vbox.customize ["modifyvm", :id, "--memory", "2048"]
  #     vbox.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"] # eth2
  #   end
  # end
end
