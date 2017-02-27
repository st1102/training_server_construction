require "spec_helper"

describe package("nginx") do
  it { should be_installed }
end

describe service("nginx") do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

#describe port(443) do
#  it { should be_listening }
#end

describe file('/etc/logrotate.d/nginx') do
	it { should be_file }
	it { should be_mode 644 }
	its(:sha256sum) { should eq 'e579be6123d37831c3a56fa320f01876621c6352fe7c21e3f7a277354f8e387d' }
end

describe file('/etc/nginx/nginx.conf') do
	it { should be_file }
	it { should be_mode 644 }
	its(:sha256sum) { should eq '7b7b9fbef183f2135ea0ce807b05f41995e5758f5f9644e5f6f25b39f262bcdb' }
end

describe file('/etc/nginx/conf.d/manager.conf') do
	it { should be_file }
	its(:content) { should match /listen 80;/ }
end

describe file('/etc/nginx/conf.d/phpmyadmin.conf') do
	it { should be_file }
	its(:content) { should match /listen 80;/ }
end

describe file('/etc/nginx/conf.d/status.conf') do
	it { should be_file }
	its(:content) { should match /listen 80;/ }
	its(:content) { should match /\/nginx_status/ }
	its(:content) { should match /\/phpfpm_status/ }
end
