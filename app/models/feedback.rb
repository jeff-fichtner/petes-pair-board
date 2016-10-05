class Feedback < ActiveRecord::Base
  belongs_to :pairing
  belongs_to :feedbackable, polymorphic: true
end
