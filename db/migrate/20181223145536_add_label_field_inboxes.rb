class AddLabelFieldInboxes < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :label, :string
  end
end
