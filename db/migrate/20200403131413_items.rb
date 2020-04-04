class Items < ActiveRecord::Migration[5.2]
  def change
  	create_table :items do |t|
			t.string :item_name
			t.integer :qty, :default => 0
			t.integer :position
	    t.timestamps
	    t.references :user, index: true, foreign_key: true
	  end
  end
end
