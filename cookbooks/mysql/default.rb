package 'http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm' do
  not_if 'rpm -q mysql57-community-release-el7-7'
  action :install
end

package 'mysql-community-server' do
  action :install
end
