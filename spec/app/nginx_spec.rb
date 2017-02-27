require "spec_helper"

describe package("nginx") do
	it { should be_installed }
end

describe command("rpm -q nginx") do
	its(:stdout) { should match /1\.11\.10/ }
end

describe service("nginx") do
	it { should be_enabled }
	it { should be_running }
end

describe port(80) do
	it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe file('/etc/nginx/nginx.conf') do
	it { should be_file }
	it { should be_mode 644 }
end

describe file('/etc/nginx/conf.d/app.conf') do
	it { should be_file }
	it { should be_mode 644 }
	its(:content) { should match /listen 80;/ }
	its(:content) { should match /listen 443;/ }
	its(:content) { should match /unix:\/var\/run\/app\.sock;/ }
end

describe file('/etc/nginx/conf.d/status.conf') do
	it { should be_file }
	it { should be_mode 644 }
	its(:content) { should match /listen 80;/ }
	its(:content) { should match /\/nginx_status/ }
end
