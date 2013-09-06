class CreateFeedBacks < ActiveRecord::Migration
  def change
    create_table :feed_backs do |t|
      t.string :subject
      t.text :comment

      t.timestamps
    end
  end
end
