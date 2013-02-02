require "fileutils"

BOXES = {
  :lucid32 => {
    :box_url => "http://files.vagrantup.com/lucid32.box",
  },
  :lucid64 => {
    :box_url => "http://files.vagrantup.com/lucid64.box",
  },
  :precise32 => {
    :box_url => "http://files.vagrantup.com/precise32.box",
  },
  :precise64 => {
    :box_url => "http://files.vagrantup.com/precise64.box",
  },
}

Vagrant::Config.run do |config|
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "."
    puppet.manifest_file  = "bootstrap.pp"
    puppet.module_path    = "puppet/modules"

    FileUtils.mkdir_p puppet.module_path
  end

  BOXES.each do |name, options|
    config.vm.define name do |box|
      box.vm.box       = options[:box] || name.to_s
      box.vm.host_name = options[:host_name] || name.to_s
      box.vm.box_url   = options[:box_url]
    end
  end
end
