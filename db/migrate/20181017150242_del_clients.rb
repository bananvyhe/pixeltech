class DelClients < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :users, :clients, foreign_key: true
  end
end
