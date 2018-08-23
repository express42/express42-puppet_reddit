require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

#require 'beaker/puppet_install_helper'
#run_puppet_install_helper

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

RSpec.configure do |c|
  c.before :suite do
    hosts.each do |host|
      on host, puppet('module', 'install', 'puppetlabs-stdlib')
      on host, puppet('module', 'install', 'puppetlabs-java')
      on host, puppet('module', 'install', 'puppet-archive')
      copy_module_to(host, source: PROJECT_ROOT, module_name: 'jenkins')
    end
  end
end