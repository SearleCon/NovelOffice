class RemoveUserIdFromScenes < ActiveRecord::Migration
  def change
    remove_column :scenes, :user_id, :integer
  end
end
