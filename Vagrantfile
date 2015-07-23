# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/centos-7.0"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"

  #
  # WSO2 DEV
  #

  config.vm.define "wso2dev" do |wso2dev|
    #ESB
    wso2dev.vm.network "forwarded_port", guest: 9443, host: 9443
    wso2dev.vm.network "forwarded_port", guest: 9763, host: 9763
    wso2dev.vm.network "forwarded_port", guest: 8280, host: 8280
    wso2dev.vm.network "forwarded_port", guest: 8243, host: 8243
    #AM
    wso2dev.vm.network "forwarded_port", guest: 9445, host: 9445
    wso2dev.vm.network "forwarded_port", guest: 9765, host: 9765
    wso2dev.vm.network "forwarded_port", guest: 8282, host: 8282
    wso2dev.vm.network "forwarded_port", guest: 8245, host: 8245
    #BAM
    wso2dev.vm.network "forwarded_port", guest: 9444, host: 9444
    wso2dev.vm.network "forwarded_port", guest: 9764, host: 9764
    wso2dev.vm.network "forwarded_port", guest: 7614, host: 7614
    #GREG
    wso2dev.vm.network "forwarded_port", guest: 9446, host: 9446

    wso2dev.vm.network :private_network, ip: "192.168.11.11"
    wso2dev.vm.hostname = "wso2dev.local"

    wso2dev.vm.provider "virtualbox" do |vb|
      vb.name = 'wso2dev-box'
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
      vb.customize ["modifyvm", :id, "--acpi", "on"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]

      # wso2dev.vm.synced_folder "./repository/esb/deployment/server", "/opt/wso2dev-4.8.1/repository/deployment/server", user:"vagrant", group:"vagrant"
      # wso2dev.vm.synced_folder "./repository/esb/conf", "/opt/wso2dev-4.8.1/repository/conf", user:"vagrant", group:"vagrant"

      wso2dev.vm.provision :shell, :path => "provision/esb/shell/install_init.sh"
      wso2dev.vm.provision :shell, :path => "provision/esb/shell/download.sh"
      #wso2dev.vm.provision :shell, :path => "provision/shell/build.sh"

      wso2dev.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "provision/esb/puppet/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.module_path = "provision/esb/puppet/modules"
      end
    end

  end

end
