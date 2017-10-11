include_recipe "../cookbooks/sshd/default.rb"
include_recipe "../cookbooks/vim/default.rb"
include_recipe "../cookbooks/wget/default.rb"
include_recipe "../cookbooks/firewalld/default.rb"
include_recipe "../cookbooks/mysql/default.rb"

include_recipe "../cookbooks/nginx/default.rb"
remote_file "/etc/nginx/conf.d/default.conf" do
  source "./files/etc/conf.d/default.conf"
end
service "nginx" do
  subscribes [:restart], "remote_file[/etc/nginx/conf.d/default.conf]"
end

include_recipe "../cookbooks/redis/default.rb"
