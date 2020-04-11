class RenameItemsColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_table :items, :my_items
  end
end
