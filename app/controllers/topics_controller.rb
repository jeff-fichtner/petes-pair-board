class TopicsController < ApplicationController
  before_action :set_user

  def create
    Topic.all.each do |topic|
      if (params.keys.include? (topic.topic)) && (!@user.topics.include? (topic))
        @user.topics << topic
      elsif @user.topics.include? (topic)
        @user.topics_users.find_by(topic_id: topic.id).destroy
      end
    end
    redirect_to user_mentor_path
  end
end
