require 'spec_helper'

describe Callback do

  let(:callback) { Callback.new }

  it { should allow_mass_assignment_of(:continuous_integration) }
  it { should belong_to(:karotz_rabbit) }
  it { should ensure_inclusion_of(:continuous_integration).in_array(%w(semaphore_app travis_ci)) }

  it 'has default continuous integration set to "travis_ci"' do
    callback.continuous_integration.should == 'travis_ci'
  end
end
