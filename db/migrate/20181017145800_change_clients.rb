class ChangeClients < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :client, foreign_key: true
  end

  def down
     
    add_reference :users, :clients, foreign_key: true
  end
end
