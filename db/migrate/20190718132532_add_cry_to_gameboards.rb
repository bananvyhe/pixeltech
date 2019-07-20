class AddCryToGameboards < ActiveRecord::Migration[5.2]
  def change
  	add_column :gameboards, :cry, :integer
  end
end
