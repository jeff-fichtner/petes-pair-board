class User < ActiveRecord::Base
  has_many :feedbacks, as: :feedbackable
  has_many :pairings
  has_and_belongs_to_many :topics

  validates :group, :name, :email, :phase, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def average(ratings)
    ratings.inject{ |sum, rating| sum + rating }.to_f / ratings.size
  end
end
