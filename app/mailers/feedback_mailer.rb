class FeedbackMailer < ActionMailer::Base
  default from: 'NovelOffice <info@noveloffice.herokuapp.com>'

  def notify_support(feedback)
    @feedback = feedback
    mail(to: ENV['SUPPORT_MAIL'],
         subject: "NovelOffice Feedback Notification - #{Time.zone.today}")
  end
end
