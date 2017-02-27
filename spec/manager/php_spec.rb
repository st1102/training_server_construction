require 'spec_helper'

pkgs = [
	{:name => 'php',          :version => /7.\d+/ },
	{:name => 'php-devel',    :version => /7.\d+/ },
	{:name => 'php-mbstring', :version => /7.\d+/ },
	{:name => 'php-pdo',      :version => /7.\d+/ },
	{:name => 'php-gd',       :version => /7.\d+/ },
	{:name => 'php-mcrypt',   :version => /7.\d+/ },
	{:name => 'php-mysqlnd',  :version => /7.\d+/ },
	{:name => 'php-xml',      :version => /7.\d+/ },
]

pkgs.each do |pkg|
	describe command("rpm -qa #{pkg[:name]}") do
		its(:stdout) { should match pkg[:version] }
	end
end

describe command('/usr/local/bin/composer --version') do
	its(:exit_status) { should eq 0 }
end

describe file('/etc/php.ini') do
	it { should be_file }
end

describe file('/etc/php.d') do
	it { should be_directory }
end

describe command('which php') do
	its(:stdout) { should match '/usr/bin/php' }
end

describe command('php -i | grep "Loaded Configuration File"') do
	its(:stdout) { should match /\/etc\/php\.ini/ }
end
