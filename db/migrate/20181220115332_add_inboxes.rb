class AddInboxes < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :amount, :text
  	add_column :inboxes, :unaccepted, :boolean
  end
end
