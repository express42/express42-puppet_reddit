require 'spec_helper_acceptance'

describe 'puppet_reddit::reddit' do
  let(:manifest) {
    <<-EOS
include puppet_reddit::reddit
    EOS
  }
  it 'should apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end
end

describe service('puma') do
  it {is_expected.to be_running}
  it {is_expected.to be_enabled}
end
