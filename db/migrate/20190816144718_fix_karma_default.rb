class FixKarmaDefault < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gameboards, :karma, :integer
  	add_column :gameboards, :karma, :integer, :default => 0
  end
end
