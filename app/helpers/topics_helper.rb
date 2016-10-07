module TopicsHelper
  def checked_topic?(topic)
    current_user.topics.include? topic
  end
end
