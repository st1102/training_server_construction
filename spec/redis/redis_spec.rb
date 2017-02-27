require 'spec_helper'

describe package('redis') do
	it { should be_installed.with_version('2.4.10') }
end

describe command('redis-cli -v') do
	its(:stdout) { should match /2\.4\.\d+/ }
end

describe command('redis-server -v') do
	its(:stdout) { should match /2\.4\.\d+/ }
end

describe command('which redis-cli') do
	its(:stdout) { should match /\/usr\/bin\/redis-cli/ }
end

describe command('which redis-server') do
	its(:stdout) { should match /\/usr\/sbin\/redis-server/ }
end
