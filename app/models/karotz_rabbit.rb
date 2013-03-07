class KarotzRabbit < ActiveRecord::Base
  extend Enumerize

  attr_accessible :continuous_integration, 
                  :install_id, 
                  :name
                  
  belongs_to      :user

  enumerize :continuous_integration, in: %w(semaphore_app), default: 'semaphore_app'

  validates :name,                   presence: true
  validates :install_id,             presence: true
end
