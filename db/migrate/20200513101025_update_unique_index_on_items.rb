class UpdateUniqueIndexOnItems < ActiveRecord::Migration[5.2]
  def change

  	remove_reference :my_items, :item_attribute 
  		add_reference :my_items, :item_attribute 
  end
end
