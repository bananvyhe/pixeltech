class ChangeDefPkVal < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gameboards, :pk
  	 add_column :gameboards, :pk, :integer, :default => 0

  end
end
