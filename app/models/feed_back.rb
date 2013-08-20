class FeedBack < ActiveRecord::Base
  validates :subject, :comment, presence: true
end
