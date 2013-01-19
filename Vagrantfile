require "fileutils"

Vagrant::Config.run do |config|
  config.vm.box     = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "."
    puppet.manifest_file  = "bootstrap.pp"
    puppet.module_path    = "puppet/modules"

    FileUtils.mkdir_p puppet.module_path
  end
end
