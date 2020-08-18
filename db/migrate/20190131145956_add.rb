class Add < ActiveRecord::Migration[5.2]
  def change
  	add_column :clients, :incoming, :float
  	add_column :clients, :spent, :float
  end
end
