Vagrant.configure("2") do |config|
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.aliases = %w{legacy.esi-showroom.local symfony.esi-showroom.local}
    config.berkshelf.enabled = true

    config.vm.hostname = "esi-showroom.local"
    config.vm.box = "ubuntu-13.04"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-i386-vagrant-disk1.box"

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.customize ["modifyvm", :id, "--memory", "2048"]
    end

    config.vm.synced_folder "./", "/var/www/esi-showroom", nfs: true

    config.vm.network "private_network", ip: "192.168.99.10"

    config.vm.provision "chef_solo" do |chef|
        chef.add_recipe "esi-showroom"
    end

    config.vm.provision "shell", inline: "cd /var/www/esi-showroom && ant"
end
