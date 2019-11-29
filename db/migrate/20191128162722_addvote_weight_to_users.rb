class AddvoteWeightToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :vote_weight, :integer, :default => 1
  end
end
