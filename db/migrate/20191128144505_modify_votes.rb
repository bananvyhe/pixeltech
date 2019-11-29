class ModifyVotes < ActiveRecord::Migration[5.2]
  def change
		add_reference :votes, :voteable, polymorphic: true, index: true
  end
end
