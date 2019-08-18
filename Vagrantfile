# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/30-cloud-base"
  config.vm.box_version = "30.20190425.0"
  
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
     vb.name = "fedors_30_ws"
     vb.memory = "2048"
     vb.cpus = "2"
  end
  
  config.vm.provision "shell", inline: <<-SHELL
     dnf -y update
     dnf --setopt=tsflags=nodocs install -y wget curl tar gzip buildah podman docker cekit python3-odcs-client python3-docker python3-docker-squash
  SHELL
end
