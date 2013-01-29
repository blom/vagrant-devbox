require "fileutils"

Vagrant::Config.run do |config|
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "."
    puppet.manifest_file  = "bootstrap.pp"
    puppet.module_path    = "puppet/modules"

    FileUtils.mkdir_p puppet.module_path
  end

  config.vm.define :lucid32 do |box|
    box.vm.box       = "lucid32"
    box.vm.host_name = "lucid32"
    box.vm.box_url   = "http://files.vagrantup.com/lucid32.box"
  end

  config.vm.define :precise32 do |box|
    box.vm.box       = "precise32"
    box.vm.host_name = "precise32"
    box.vm.box_url   = "http://files.vagrantup.com/precise32.box"
  end
end
