class Topic < ActiveRecord::Base
  has_many :topics_users
  has_many :mentors, through: :topics_users

  validates :topic, presence: true
end
