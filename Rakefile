require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('config.yml')

desc "Run spec to all hosts"
task :spec => 'spec:all'

namespace :spec do
	task :all => properties.keys.map {|key| 'spec:' + key.split('.')[0] }
	properties.keys.each do |key|
		desc "Run spec to #{key}"
		RSpec::Core::RakeTask.new(key.split('.')[0].to_sym) do |t|
			properties[key]['hosts'].each do |host|
				ENV['SPEC_ENV']  ||= 'dev'
				ENV['SPEC_ROLE'] ||= key
				ENV['SPEC_HOST'] ||= host['lips'][0]
				ENV['SPEC_USER'] ||= host['user'] ||= 'vagrant'
				puts "\n========================================"
				puts "ROLE: #{ENV['SPEC_ROLE']}"
				puts "HOST: #{ENV['SPEC_HOST']}"
				puts "USER: #{ENV['SPEC_USER']}"
				puts "========================================\n"
				t.fail_on_error = false
				t.pattern = "spec/{#{key}}/*_spec.rb"
			end
		end
	end
end
