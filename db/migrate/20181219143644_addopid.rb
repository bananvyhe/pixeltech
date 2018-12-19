class Addopid < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :operation_id, :text
  end
end
