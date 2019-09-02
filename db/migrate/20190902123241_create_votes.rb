class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t.integer :user_id
    	t.integer :gameboards_id
    	t.boolean :vote
      t.timestamps
    end
  end
end
