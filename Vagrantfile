Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "bootstrap/bootstrap.sh"
  config.vm.provision :shell, path: "bootstrap/xmonad.sh"
  config.vm.provision :shell, path: "bootstrap/kbd.sh"
  config.vm.provision :shell, path: "bootstrap/gnometerm.sh"
  config.vm.provision :shell, path: "bootstrap/common.sh"
  config.vm.provision :shell, path: "bootstrap/code.sh"
  config.vm.provision :shell, path: "bootstrap/docker.sh"
  config.vm.provision :shell, path: "bootstrap/complete.sh"
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.cpus = 4
    vb.memory= 4048
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    vb.customize ["modifyvm", :id, "--vram", "100"]
  end
end
