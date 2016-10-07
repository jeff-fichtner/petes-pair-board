class TopicsController < ApplicationController
  def create
    p params
    redirect_to user_mentor_path
  end
end
