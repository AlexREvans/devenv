Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install_mode = "pip"
  end

  config.vm.network "forwarded_port", guest: 1234, host: 8080, id: tomcat
  config.vm.network "forwarded_port", guest: 4567, host: 8081, id: database
  config.vm.synced_folder "~/processWorkspace", "/home/vagrant/processWorkspace/"

  config.vm.provider :virtualbox do |vb|
    vb.cpus = 2
    vb.memory= 1024
  end
end
