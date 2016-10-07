class TopicsUser < ActiveRecord::Base
  belongs_to :mentor, class_name: "User"
  belongs_to :topic

  validates :mentor_id, :topic_id, presence: true
end
