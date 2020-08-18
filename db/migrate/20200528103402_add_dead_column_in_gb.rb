class AddDeadColumnInGb < ActiveRecord::Migration[5.2]
  def change
  	add_column :gameboards, :dead, :boolean, :default => false
  end
end
