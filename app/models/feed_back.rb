class FeedBack < ActiveRecord::Base
  validates :subject, :comment, presence: true

  after_commit :notify_support, on: :create

  private
  def notify_support
    Delayed::Job.enqueue FeedbackMailJob.new(self.id)
  end
end
