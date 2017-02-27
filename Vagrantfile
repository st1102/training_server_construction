# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"
conf = YAML.load_file("config.yml")

Vagrant.configure("2") do |config|
	config.ssh.insert_key = false

	conf.each do |role, confs|
		confs["hosts"].each.with_index(1) do |host, num|
			config.vm.define vm_name = confs["hosts"].size >= 2 ? "%s-%02d" % [role, num] : role do |role|
				role.vm.box = confs["box"]
				host["lips"].each do |lip|
					role.vm.network "private_network", ip: lip
				end
				role.vm.hostname = host["hostname"]

				if confs.has_key?("syncs") then
					confs["syncs"].each do |sync|
						role.vm.synced_folder sync["host"], sync["guest"],
							owner: sync.has_key?("owner") ? sync["owner"] : "vagrant",
							group: sync.has_key?("group") ? sync["group"] : "vagrant",
							mount_options: [
								"dmode=%s,fmode=%s" % [
									sync.has_key?("dmode") ? sync["dmode"] : "755",
									sync.has_key?("fmode") ? sync["fmode"] : "755"
								]
							]
					end
				end

				if confs.has_key?("provision") then
					confs["provision"].each do |script|
						role.vm.provision :shell do |shell|
							shell.path = script
							shell.privileged = true
						end
					end
				end

				if confs.has_key?("itamae") then
					confs["itamae"].each do |itamae|
						role.vm.provision :shell do |shell|
							shell.inline = <<-SHELL
cd /tmp
PASSWORD=#{ENV['PASSWORD']} bundle exec itamae local -j #{itamae["json"]} #{itamae["recipe"]}
							SHELL
						end
					end
				end
			end
		end
	end
end
