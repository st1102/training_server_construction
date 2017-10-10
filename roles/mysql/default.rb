include_recipe "../cookbooks/sshd/default.rb"
include_recipe "../cookbooks/vim/default.rb"
include_recipe "../cookbooks/wget/default.rb"

include_recipe "../cookbooks/firewalld/default.rb"
execute "sudo firewall-cmd --permanent --add-port=3306/tcp"
execute "sudo firewall-cmd --reload"

include_recipe "../cookbooks/mysql/default.rb"
service 'mysqld' do
  action [:enable, :start]
end
