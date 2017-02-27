require "spec_helper"

describe command('curl -Lk localhost/nginx_status -o /dev/null -w "%{http_code}\n" -s') do
	its(:stdout) { should match /^200$/ }
end

describe command('curl -H "Host:dev.example.com" http://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^301$/ }
end

describe command('curl -kL -H "Host:dev.example.com" http://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

describe command('curl -k -H "Host:dev.example.com" https://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
