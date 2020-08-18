class ChangeTypeGbColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gameboards, :minus, :integer
  	add_column :gameboards, :minus, :string

  	remove_column :gameboards, :plus, :integer
  	add_column :gameboards, :plus, :string
  end
end
