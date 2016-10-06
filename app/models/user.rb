class User < ActiveRecord::Base
  # has_many :feedbacks
  has_many :mentor_pairings, class_name: "Pairing", foreign_key: :mentor_id
  has_many :student_pairings, class_name: "Pairing", foreign_key: :student_id

  has_many :mentor_feedbacks, through: :mentor_pairings, source: :feedbacks
  has_many :student_feedbacks, through: :student_pairings, source: :feedbacks

  has_and_belongs_to_many :topics

  validates :name, :email, :phase, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def average(ratings)
    ratings.inject{ |sum, rating| sum + rating }.to_f / ratings.size
  end
end
