Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/wily64"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.memory = 2048
    vb.cpus = 4
  end
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.synced_folder "../", "/vagrant", type: "smb"
  config.vm.network "private_network", ip: "192.168.98.100"
end
