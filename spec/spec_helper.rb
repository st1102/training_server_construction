require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'
require 'rspec/its'

set :backend, :ssh
properties = YAML.load_file('config.yml')

host = ENV['SPEC_HOST']
role = ENV['SPEC_ROLE']
user = ENV['SPEC_USER']

set :host, host
set :ssh_options, :user => user

set_property properties[role]

options = {
	paranoid: false,
	user_known_hosts_file: '/dev/null',
}
Net::SSH.start(host, user, options)
