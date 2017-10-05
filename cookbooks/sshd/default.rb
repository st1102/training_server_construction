# file "/etc/ssh/sshd_config" do
#  action :edit
#  mode "777"
#  block do |content|
#    if content =~ /^PermitRootLogin/i then
#      # gsub!は正規表現に基づく置換
#      content.gsub!(/^PermitRootLogin.*$/i, 'PermitRootLogin without-password')
#    end
#    if content =~ /^#PasswordAuthentication yes/i then
#      # gsub!は正規表現に基づく置換
#      content.gsub!(/^#PasswordAuthentication yes.*$/i, 'PasswordAuthentication yes')
#    end
#    if content =~ /^PasswordAuthentication no/i then
#      # gsub!は正規表現に基づく置換
#      content.gsub!(/^PasswordAuthentication no.*$/i, '#PasswordAuthentication no')
#    end
#  end
#end

remote_file "/etc/ssh/sshd_config" do
  source "./files/etc/conf.d/sshd_config"
end

execute "systemctl restart sshd"
