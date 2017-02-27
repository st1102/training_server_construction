require 'spec_helper'

pkgs = %w(git wget gcc gcc-c++ php-pecl-zip)

pkgs.each do |pkg|
	describe package(pkg) do
		it { should be_installed }
	end
end
