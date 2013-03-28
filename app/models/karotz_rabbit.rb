class KarotzRabbit < ActiveRecord::Base

  attr_accessible :install_id,
                  :name

  belongs_to :user
  has_many   :callbacks

  validates :name,       presence: true
  validates :install_id, presence: true
end
