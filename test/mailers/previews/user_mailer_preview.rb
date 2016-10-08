class UserMailerPreview < ActionMailer::Preview
  def user_mailer_preview
    UserMailer.welcome_email(User.first)
  end
end
