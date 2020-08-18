class ChangeDefaultValue < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gameboards, :cry, :integer

  	add_column :gameboards, :cry, :integer, :default => 0
  end
end
