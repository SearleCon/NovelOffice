class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :stories
  has_many :scenes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_initialize :init


  private
  def init
    if new_record?
      self.time_zone = Time.zone.name
    end
  end
end
