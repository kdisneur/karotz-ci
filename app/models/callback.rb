class Callback < ActiveRecord::Base
  extend Enumerize

  attr_accessible :continuous_integration

  belongs_to :karotz_rabbit
  enumerize  :continuous_integration, in: %w(semaphore_app travis_ci), default: 'travis_ci'
end
