require 'spec_helper'

pkgs = [
	{:name => 'mysql-community-common', :version => /5\.7\.\d+/ },
	{:name => 'mysql-community-client', :version => /5\.7\.\d+/ },
	{:name => 'mysql-community-server', :version => /5\.7\.\d+/ }
]

pkgs.each do |pkg|
	describe command("rpm -q #{pkg[:name]}") do
		its(:stdout) { should match pkg[:version] }
	end

	describe package(pkg[:name]) do
		it { should be_installed }
	end
end
