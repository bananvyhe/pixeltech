class LastFieldsInboxes < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :notification_type, :string
  	add_column :inboxes, :currency, :string
  	add_column :inboxes, :sender, :string
  end
end
