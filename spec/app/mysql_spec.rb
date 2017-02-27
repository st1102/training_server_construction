require "spec_helper"

describe command('mysql --version') do
	its(:stdout) { should match /5\.7\.\d+/}
end
