class SessionsController < ApplicationController
  def new
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      sessions[:user_id] = user.id
      redirect_to @user
    else
      render new_user_path(@user)
    end
  end
end
