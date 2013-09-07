class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :overview
      t.text :content

      t.timestamps
    end
  end
end
