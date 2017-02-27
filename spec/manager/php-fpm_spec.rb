require "spec_helper"

describe package("php-fpm") do
  it { should be_installed }
end

describe service("php-fpm") do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/php-fpm.conf') do
	it { should be_file }
end

describe file('/etc/php-fpm.d/manager.conf') do
	it { should be_file }
	its(:content) { should match /user = nginx/ }
	its(:content) { should match /group = nginx/ }
	its(:content) { should match /listen = \/var\/run\/php-fpm\/php-fpm\.sock/ }
	its(:content) { should match /listen\.owner = nginx/ }
	its(:content) { should match /listen\.group = nginx/ }
	its(:content) { should match /listen\.mode = 0660/ }
	its(:content) { should match /pm\.status_path = \/phpfpm_status/ }
end

describe file("/var/run/php-fpm/php-fpm.sock") do
	it { should be_socket }
end

describe file('/var/lib/php/session') do
	it { should be_directory }
	it { should be_mode '777' }
end
