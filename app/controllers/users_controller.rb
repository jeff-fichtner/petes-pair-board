class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:type, :name, :email, :password, :phase)
  end
end
