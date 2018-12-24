class AddOtherFieldsInboxes < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :withdraw_amount, :integer
  	add_column :inboxes, :datetime, :string
  	add_column :inboxes, :codepro, :boolean
  	add_column :inboxes, :unaccepted, :boolean
  end
end
