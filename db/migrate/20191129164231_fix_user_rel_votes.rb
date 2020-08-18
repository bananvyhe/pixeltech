class FixUserRelVotes < ActiveRecord::Migration[5.2]
  def change
  	remove_column :votes, :user_id, :integer
  	add_reference :votes, :user, index: true
  end
end
