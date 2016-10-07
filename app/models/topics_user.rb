class TopicsUser < ActiveRecord::Base
  belongs_to :topic
  belongs_to :mentor, class_name "User"

  validates :mentor_id, :topic_id, presence: true
end
