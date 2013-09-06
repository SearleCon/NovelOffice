class UserMailer < ActionMailer::Base
  default from: 'NovelOffice <info@NovelOffice.herokuapp.com>'

  def welcome(user)
    @user = user
    @url  = root_url
    mail(to: user.email,
         subject: "Welcome to NovelOffice")
  end
end
