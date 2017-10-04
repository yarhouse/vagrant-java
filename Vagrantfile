# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit
  config.vm.box = "ubuntu/trusty64"

  # Configure the VM to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 8217, host: 8217
  config.vm.network :forwarded_port, guest: 8219, host: 8219
  config.vm.network :forwarded_port, guest: 8201, host: 8201
  config.vm.network :forwarded_port, guest: 8229, host: 8229

  # Forward your local SSH agent onto the box
  config.ssh.forward_agent = true

  # Mount the project folder inside the virtualbox
  # Aaron: because the repo of 'vagrant-jave'
  config.vm.synced_folder "../", "/home/vagrant/projects"

  # Install some package dependencies
  #config.vm.provision :shell, inline: "sudo apt-get update && sudo apt-get install -y libreadline-dev libcurl4-openssl-dev libqt4-dev"

  config.vm.provision :shell, inline: "sudo apt-get update && sudo apt-get install -y zip git"

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]

    chef.add_recipe "java"
    chef.add_recipe "java_se"
    chef.add_recipe "ark"
    chef.add_recipe "postgresql"
    chef.add_recipe "maven"
    chef.add_recipe "nodejs"

    config.vm.provision "shell", inline: "sudo npm install -g grunt-cli"
    config.vm.provision "shell", path: "groovy.sh"
  end
end