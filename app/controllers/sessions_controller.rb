class SessionsController < ApplicationController
  def new
    @user = User.find_by(email: login_params[0]).try(:authenticate, login_params[1])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.new
      @errors = ["The username or password don't match our records."]
      render new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

  private
  def login_params
    params.require(:user).permit(:email, :password).values
  end
end
