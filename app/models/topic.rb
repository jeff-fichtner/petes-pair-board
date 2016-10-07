class Topic < ActiveRecord::Base
  has_and_belongs_to_many :mentors, class_name: "User"

  validates :topic, presence: true
end
