package 'http://rpms.famillecollet.com/enterprise/remi-release-7.rpm' do
  not_if 'rpm -q remi-release'
  action :install
end

package 'redis' do
  action :install
end
