class FeedbacksController < ApplicationController
  before_action :set_user
  def index
    @received_student_feedbacks = @user.received_student_feedbacks
    @received_mentor_feedbacks = @user.received_mentor_feedbacks
    @given_student_feedbacks = @user.given_student_feedbacks
    @given_mentor_feedbacks = @user.given_mentor_feedbacks
  end

  def create
    feedback = @user.feedbacks.new(feedback_params.merge(rating: params[:rating]).merge(pairing_id: params[:pairing_id]))

    if feedback.save
      redirect_to @user
    else
      @errors = feedback.errors.full_messages
      render new_user_pairing_feedback_path
    end
  end

  def new
    @feedback = Feedback.new
  end

  private
  def feedback_params
    params.require(:feedback).permit(:pairing_id, :comment, :rating)
  end
end
