Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.memory = 2048
    vb.cpus = 4
  end
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.synced_folder "../", "/code", type: "smb"
  config.vm.synced_folder "../../.devssh", "/devssh", type: "smb", mount_options: ["dir_mode=777", "file_mode=600"]  
  config.vm.network "private_network", ip: "192.168.98.100"
end
