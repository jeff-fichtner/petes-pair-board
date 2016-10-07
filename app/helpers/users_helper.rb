module UsersHelper
  def display_rating(user)
    if user.unrated?
      "unrated"
    else
      user.average
    end
  end
end
