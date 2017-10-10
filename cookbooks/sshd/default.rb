remote_file "/etc/ssh/sshd_config" do
  source "./files/etc/conf.d/sshd_config"
end

execute "systemctl restart sshd" do
  subscribes :run, "remote_file[/etc/ssh/sshd_config]"
end
