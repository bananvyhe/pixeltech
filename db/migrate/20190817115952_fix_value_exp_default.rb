class FixValueExpDefault < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gameboards, :expirience, :bigint
  	add_column :gameboards, :expirience, :bigint, :default => 0
  end
end
