class AddFieldInInboxesShahashforgot < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :sha1_hash, :string
  end
end
