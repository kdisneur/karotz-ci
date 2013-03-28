require 'spec_helper'

describe KarotzRabbit do
  it { should allow_mass_assignment_of(:install_id) }
  it { should allow_mass_assignment_of(:name) }

  it { should belong_to(:user) }
  it { should have_many(:callbacks) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:install_id) }
end
