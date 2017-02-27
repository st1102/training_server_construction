require "spec_helper"

describe file("/etc/ssh/sshd_config") do
	its(:content) { should match /PermitRootLogin without-password/ }
end

%w(vim wget).each do |pkg|
	describe command("which #{pkg}") do
		its(:exit_status) { should eq 0 }
	end
end
