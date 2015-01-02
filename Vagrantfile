# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "ubuntu/trusty32"

  # vagrant-cachier is a plugin that keeps packages around so you don't have
  # to download them from our poor benighted providers over and over and over
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provision :shell, :path => "bootstrap/install-dependencies.sh"
  config.vm.network "forwarded_port", guest: 22, host: 2200
end
