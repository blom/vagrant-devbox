Vagrant::Config.run do |config|
  config.vm.box     = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "init.pp"
  end
end
