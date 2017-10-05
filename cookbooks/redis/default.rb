package 'http://rpms.famillecollet.com/enterprise/remi-release-7.rpm' do
  not_if 'rpm -q remi-release'
  action :install
end

package 'redis' do
  action :install
end

if (node[:hostname] = /redis/)
  remote_file "/etc/redis.conf" do
    mode "644"
    source "./files/etc/conf.d/redis.conf"
  end

  service 'redis' do
    action [:enable, :start]
  end
end
