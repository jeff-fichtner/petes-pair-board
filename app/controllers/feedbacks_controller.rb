class FeedbacksController < ApplicationController
  before_action :set_user
  def index
    # sorting feedback
  end

  def create
    feedback = @user.feedbacks.new(feedback_params)

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
