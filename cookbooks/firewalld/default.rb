service 'firewalld' do
  action [:enable, :start]
end

#p node[:hostname]

if (node[:hostname] = /mysql/)
  execute "sudo firewall-cmd --permanent --add-port=3306/tcp"
end

if (node[:hostname] = /redis/)
  execute "sudo firewall-cmd --permanent --add-port=6379/tcp"
end

execute "sudo firewall-cmd --reload"
