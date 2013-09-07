class Story < ActiveRecord::Base
	validates :overview, presence: true
end
