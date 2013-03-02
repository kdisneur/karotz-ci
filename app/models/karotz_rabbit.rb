class KarotzRabbit < ActiveRecord::Base
  extend Enumerize

  after_create :generate_token!

  attr_accessible :continuous_integration, :install_id, :name
  belongs_to      :user

  enumerize :continuous_integration, in: %w(semaphore_app), default: 'semaphore_app'

  validates :name,                   presence: true
  validates :install_id,             presence: true

  private

  def generate_token!
    self.token = Digest::SHA1.hexdigest("#{self.id}--#{self.user_id}")
    self.save
  end
end
