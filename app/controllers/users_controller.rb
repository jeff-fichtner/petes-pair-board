class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  def show
    redirect_to pairings_path
  end

  def student
    @upcoming_student_pairings = Pairing.upcoming_student_pairings(current_user)
    @previous_student_pairings = Pairing.previous_student_pairings(current_user)
  end

  def mentor
    @upcoming_mentor_pairings = Pairing.upcoming_mentor_pairings(current_user)
    @previous_mentor_pairings = Pairing.previous_mentor_pairings(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: user_params[:name], email: user_params[:email], password: user_params[:password], phase: params[:phase])
    p "*************************"
    p user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to 'users#new'
  end

  private
  def set_user
    if current_user
      @user ||= current_user
    else
      redirect_to new_user_path
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :phase)
  end
end
