class User < ActiveRecord::Base
  has_many :feedbacks, as: :feedbackable
  has_many :pairings
end
