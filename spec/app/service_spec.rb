require "spec_helper"

describe command('curl -Lk localhost/nginx_status -o /dev/null -w "%{http_code}\n" -s') do
	its(:stdout) { should match /^200$/ }
end

describe command('curl localhost/ -o /dev/null -w "%{http_code}\n" -s') do
	its(:stdout) { should match /^300$/ }
end

describe command('curl -Lk localhost/ -o /dev/null -w "%{http_code}\n" -s') do
	its(:stdout) { should match /^200$/ }
end

describe command('curl -Lk -H "Host:dev.example.com" https://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^300$/ }
end

describe command('curl -Lk -H "Host:dev.example.com" https://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^300$/ }
end
