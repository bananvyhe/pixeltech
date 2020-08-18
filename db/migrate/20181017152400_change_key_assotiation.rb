class ChangeKeyAssotiation < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :users, :client, foreign_key: true
  	add_reference :clients, :user, foreign_key: true
  end
end
