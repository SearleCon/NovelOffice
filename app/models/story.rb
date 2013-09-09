class Story < ActiveRecord::Base
	belongs_to :user
	has_many :scenes
	
	validates :overview, presence: true
end