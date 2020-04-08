class ChangeItemsUniq < ActiveRecord::Migration[5.2]
  def change
 
  		remove_reference :items, :item_attribute, foreign_key: true
  		add_reference :items, :item_attribute, foreign_key: true, index: {unique: true}
  end
end
