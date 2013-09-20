class Scene < ActiveRecord::Base
	belongs_to :story, touch: true
end
