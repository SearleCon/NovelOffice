class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_initialize :init
  after_commit :send_welcome_mail, on: :create


  private
  def init
    if new_record?
      self.time_zone = Time.zone.name
    end
  end

  def send_welcome_mail
    Delayed::Job.enqueue WelcomeMailJob.new(self.id)
  end
end
