class ClientChangeFloat < ActiveRecord::Migration[5.2]
  def change

  	change_column :clients, :ballance, :float
  end
end
