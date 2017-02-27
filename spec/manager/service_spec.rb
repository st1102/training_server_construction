require "spec_helper"

describe command('curl -Lk -H "Host:dev.pma.v2.adroute.focas.jp" https://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

describe command('curl -Lk -H "Host:dev.v2.adroute.focas.jp" https://localhost -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

describe command('curl -Lk localhost/nginx_status -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

describe command('curl -Lk localhost/phpfpm_status -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
