# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

  config.vm.define :web do |node|
    node.vm.network "forwarded_port", guest: 80, host: 8080
    node.vm.network "private_network", ip: "10.1.1.3"
    # node.vm.network "public_network"
    #node.vm.synced_folder "../data", "/vagrant_data", type: :nfs
    node.vm.provider "virtualbox" do |vb|
      vb.name = "trusty64-web"
      vb.memory = "2048"
      vb.cpus = 2
    end
  end

  config.vm.define :db do |node|
    node.vm.network "private_network", ip: "10.1.1.10"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "trusty64-db"
      vb.memory = "1024"
    end
  end

  config.vm.define :dev do |node|
    node.vm.network "private_network", ip: "10.1.1.100"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "trusty64-dev"
      vb.memory = "1024"
    end
  end

  config.vm.provision "ansible" do |p|
    p.groups = {
      "all" => ["web", "db", "dev"],
      "web" => ["web"],
      "db" => ["db"],
    }
    p.playbook = 'main.yml'
  end
end
