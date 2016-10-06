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

  def average(ratings)
    ratings.inject{ |sum, rating| sum + rating }.to_f / ratings.size
  end

  def mentor_feedback
    self.mentor_pairings.map do |pairing|
      yield(pairing)
    end
  end

  def received_mentor_feedbacks
    pairing.feedbacks.select { |feedback| feedback.user_id == pairing.student_id }
  end

  def given_mentor_feedbacks
    self.mentor_pairings.each do |pairing|
      feedback += pairing.feedbacks.select { |feedback| feedback.user_id == pairing.mentor_id }
    end
  end

  def received_student_feedbacks
    self.student_pairings.each do |pairing|
      feedback += pairing.feedbacks.select { |feedback| feedback.user_id == pairing.mentor_id }
    end
  end

  def given_student_feedbacks
    self.student_pairings.each do |pairing|
      feedback += pairing.feedbacks.select { |feedback| feedback.user_id == pairing.student_id }
    end
  end

  def sort
    self.sort { |a,b| a.pairing.start_at <=> b.pairing.start_at }
  end
end
