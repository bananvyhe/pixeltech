class AddPkToGameb < ActiveRecord::Migration[5.2]
  def change
  	add_column :gameboards, :pk, :boolean, :default => false
  	add_column :gameboards, :plus, :integer, :default => 0
  	add_column :gameboards, :minus, :integer, :default => 0
  	add_column :gameboards, :message, :string
  end
end
