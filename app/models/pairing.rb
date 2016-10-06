class Pairing < ActiveRecord::Base
  has_many :feedbacks
  belongs_to :mentor, class_name: "User", foreign_key: :mentor_id
  belongs_to :student, class_name: "User", foreign_key: :student_id

  attr_writer :start_time_text

  validate :check_start_time_text

  before_save :save_start_time_text

  def start_time_text
    @start_time_text || start_time.try(:strftime, "%Y-%m-%d %H:%M:%S")
  end

  def save_start_time_text
    self.start_time = Time.zone.parse(@start_time_text) if @start_time_text.present?
  end

  # this custom validation does not work...why?
  def check_start_time_text
    if @start_time_text.present? && Time.zone.parse(@start_time_text).nil?
      errors.add :start_time_text, "cannot be parsed"
    end
    rescue ArgumentError
      errors.add :start_time_text, "is out of range"
  end

end
