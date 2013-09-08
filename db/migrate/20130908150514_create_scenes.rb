class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title
      t.text :scene_content
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
  end
end
