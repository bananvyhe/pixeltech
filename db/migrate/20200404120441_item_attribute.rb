class ItemAttribute < ActiveRecord::Migration[5.2]
  def change
  	remove_column :items, :item_name
  	remove_column :items, :description
  	add_column :items, :description, :string
  	create_table :item_attributes do |t|
			t.string :item_name
			t.string :description 
			t.string :image
	  end  	  	
  	add_reference :items, :item_attribute, foreign_key: true

  end
end
