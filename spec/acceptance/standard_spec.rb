require 'spec_helper_acceptance'

describe 'reddit class' do
  describe service('sshd') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
end
