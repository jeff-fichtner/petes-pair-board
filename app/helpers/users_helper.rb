module UsersHelper
  def display_rating(user)
    if user.unrated?
      "unrated"
    else
      user.average
    end
  end

  def display_student(user)
    if !user
      "this could be you"
    else
      user
    end
  end
end
