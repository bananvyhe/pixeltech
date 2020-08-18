class AddRefBallanceToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :clients, foreign_key: true
  end
end
