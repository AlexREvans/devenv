Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install_mode = "pip"
  end


  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "~/.ssh", destination: ".ssh"

  config.vm.synced_folder "./workspace", "/home/vagrant/workspace/"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.cpus = 2
    vb.memory= 2048
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "30"]
    vb.customize ["modifyvm", :id, "--vram", "50"]
  end
end
