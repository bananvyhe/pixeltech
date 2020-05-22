class ChangeGBmodel < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gameboards, :pk
  	add_column :gameboards, :pk, :integer
  	remove_column :gameboards, :minus
  	remove_column :gameboards, :plus
  	remove_column :gameboards, :starts_at_time_of_pk
  end
end
