class CreateGroupsvks < ActiveRecord::Migration[5.2]
  def change
    create_table :groupsvks do |t|
			t.string :namegroup
      t.datetime :groupsvks_date
      t.timestamps
	  end
	  add_reference :users, :groupsvk
  end
end
