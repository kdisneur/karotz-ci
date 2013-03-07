require 'spec_helper'

describe KarotzRabbit do

  let(:karotz_rabbit) { KarotzRabbit.new }

  it { should allow_mass_assignment_of(:continuous_integration) }
  it { should allow_mass_assignment_of(:install_id) }
  it { should allow_mass_assignment_of(:name) }

  it { should belong_to(:user) }

  it { should ensure_inclusion_of(:continuous_integration).in_array(%w(semaphore_app)) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:install_id) }

  it 'has default continuous integration set to "semaphore_app"' do
    karotz_rabbit.continuous_integration.should == 'semaphore_app'
  end
end
