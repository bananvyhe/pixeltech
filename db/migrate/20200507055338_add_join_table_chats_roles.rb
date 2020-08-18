class AddJoinTableChatsRoles < ActiveRecord::Migration[5.2]
  def change
  	create_table(:chats_roles, :id => false) do |t|
      t.references :chat
      t.references :role
    end
    add_index(:chats_roles, [ :chat_id, :role_id ])
  end
end
