class User < ActiveRecord::Base
  has_many :mentor_pairings, class_name: "Pairing", foreign_key: :mentor_id
  has_many :student_pairings, class_name: "Pairing", foreign_key: :student_id

  has_many :feedbacks

  has_many :mentor_feedbacks, through: :mentor_pairings, source: :feedbacks
  has_many :student_feedbacks, through: :student_pairings, source: :feedbacks

  has_and_belongs_to_many :topics

  validates :name, :email, :phase, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def average
    mentor_ratings.inject{ |sum, rating| sum + rating }.to_f / mentor_ratings.size
  end

  def sort
    self.sort { |a,b| a.pairing.start_at <=> b.pairing.start_at }
  end

  def mentor_ratings
    feedback_arr =self.mentor_feedbacks.where("user_id != #{self.id}")
    return feedback_arr.map { |feedback| feedback.rating }
  end
end
