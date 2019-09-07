class AddUniqVotesProp < ActiveRecord::Migration[5.2]
  def change
  	add_index :votes, [:user_id, :gameboard_id], unique: true
  end
end
