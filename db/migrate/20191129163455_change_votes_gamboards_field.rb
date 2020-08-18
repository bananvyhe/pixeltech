class ChangeVotesGamboardsField < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :votes, :gameboard, index: true
  end
end
