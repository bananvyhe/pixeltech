class AddExpKarmaToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :exp, :bigint
  	add_column :users, :karma, :integer
  end
end
