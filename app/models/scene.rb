class Scene < ActiveRecord::Base
  include RankedModel

  belongs_to :story, touch: true
  ranks :row_order
end
