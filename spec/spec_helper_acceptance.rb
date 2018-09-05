require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper
install_ca_certs unless ENV['PUPPET_INSTALL_TYPE'] =~ %r{pe}i
install_module_on(hosts)
install_module_dependencies_on(hosts)

UNSUPPORTED_PLATFORMS = ['windows', 'Darwin'].freeze

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

RSpec.configure do |c|
  c.before :suite do
    hosts.each do |host|
      copy_module_to(host, source: PROJECT_ROOT, module_name: 'puppet_reddit')
      on host, puppet('module install puppetlabs-vcsrepo'), :acceptable_exit_codes => [0]
    end
  end
end
