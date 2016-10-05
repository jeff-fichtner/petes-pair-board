class Pairing < ActiveRecord::Base
  has_many :feedbacks
  belongs_to :mentor, class_name: "User", foreign_key: :mentor_id
  belongs_to :student, class_name: "User", foreign_key: :student_id
end
