require "spec_helper"

describe file("/usr/share/phpmyadmin/config.inc.php") do
	it { should be_file }
	it { should be_mode 644 }
end
