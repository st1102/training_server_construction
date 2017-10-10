include_recipe "../cookbooks/sshd/default.rb"
include_recipe "../cookbooks/vim/default.rb"
include_recipe "../cookbooks/wget/default.rb"

include_recipe "../cookbooks/firewalld/default.rb"
execute "sudo firewall-cmd --permanent --add-port=6379/tcp"
execute "sudo firewall-cmd --reload"

include_recipe "../cookbooks/redis/default.rb"
remote_file "/etc/redis.conf" do
  mode "644"
  source "../cookbooks/redis/files/etc/conf.d/redis.conf"
end
service "redis" do
  subscribes [:enable, :start], "remote_file[/etc/redis.conf]"
end
