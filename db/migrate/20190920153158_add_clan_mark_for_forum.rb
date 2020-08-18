class AddClanMarkForForum < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :clan_name, :string
  end
end
