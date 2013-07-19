class AddTimeZoneAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_zone, :string
    add_column :users, :name, :string
  end
end
