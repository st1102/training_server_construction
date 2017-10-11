remote_file "/etc/yum.repos.d/nginx.repo" do
  source "./files/etc/yum.repos.d/nginx.repo"
end

package 'http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm' do
  not_if 'rpm -q nginx-release-centos-7-0.el7'
  action :install
end

package 'nginx' do
  action :install
end

remote_file "/etc/nginx/nginx.conf" do
  source "./files/etc/conf.d/nginx.conf"
end

service 'nginx' do
  action [:enable, :start]
end
