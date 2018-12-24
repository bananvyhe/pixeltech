class CheckField < ActiveRecord::Migration[5.2]
  def change
  	add_column :inboxes, :check, :string
  end
end
