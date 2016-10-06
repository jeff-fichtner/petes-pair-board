class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user

  private
  def set_user
    if current_user
      @user ||= current_user
    else
      redirect_to new_user_path
    end
  end
end
