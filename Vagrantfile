Vagrant.configure("2") do |config|
  config.vm.define :web do | web |
    web.vm.provider "virtualbox" do | vb |
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "WebNode"
    end
    web.vm.hostname = "web.al.local"
    web.vm.network "private_network", ip: "192.168.100.23"
    web.vm.provision "shell", path: "bin/web.sh"
    web.vm.box = "bento/centos-7.2"
  end
end
