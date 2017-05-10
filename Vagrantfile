
Vagrant.configure("2") do |config|
	config.vm.define "typo3base" do |nodeconfig|
		nodeconfig.vm.box = "ubuntu/xenial64"
		nodeconfig.vm.hostname = "typo3base.box"
		nodeconfig.vm.network :private_network, ip: '192.168.56.212'

        nodeconfig.vm.synced_folder "share", "/var/www/typo3base", type: "rsync", rsync__exclude: [".git/"]

		nodeconfig.vm.provider :virtualbox do |vb|
			vb.customize [
				"modifyvm", :id,
				"--cpuexecutioncap", "50",
				"--memory", "1024",
			]
		end

		nodeconfig.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		end

		nodeconfig.vm.provision "shell", inline: "apt-get update && apt-get install puppet -y"

		nodeconfig.vm.provision :puppet do |puppet|
			puppet.environment = "dev"
			puppet.environment_path = "environments"
		end
	end
end
