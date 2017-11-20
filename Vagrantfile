Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "~/.ssh", destination: ".ssh"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install_mode = "pip"
  end

  config.vm.synced_folder "./workspace", "/home/vagrant/workspace/"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.cpus = 4
    vb.memory= 4048
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    vb.customize ["modifyvm", :id, "--vram", "100"]
  end
end
