class Story < ActiveRecord::Base
	belongs_to :user
	
	validates :overview, presence: true
end