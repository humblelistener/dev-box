Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/vivid64"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
  config.vm.provision "shell", path: "bootstrap.sh"
end
