require 'spec_helper_acceptance'

describe 'reddit class' do

  describe service('reddit') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end

end
