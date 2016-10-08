class UserMailer < ActionMailer::Base
  default from: 'jff2501@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://petes-pair-board.herokuapp.com/"
    mail(to: @user.email, subject: 'Welcome to Pete\'s Pair Board')
  end
end
