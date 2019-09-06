class FixVotesGameboardId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :votes, :gameboards_id, :integer
  	add_column :votes, :gameboard_id, :integer
  end
end
