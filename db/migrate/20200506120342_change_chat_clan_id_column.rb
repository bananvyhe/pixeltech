class ChangeChatClanIdColumn < ActiveRecord::Migration[5.2]
  def change
  	# rename_column :chats, :clan_id, :role_id
  	remove_reference(:chats, :clan, foreign_key: true)
  	add_reference(:chats, :role, foreign_key: true)
  	# remove_foreign_key :chats, :clans
  	# add_foreign_key :chats, :roles
  end
end
