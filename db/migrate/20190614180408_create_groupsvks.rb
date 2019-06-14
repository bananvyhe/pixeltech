class CreateGroupsvks < ActiveRecord::Migration[5.2]
  def change
    create_table :groupsvks do |t|
			t.string :namegroup
      t.belongs_to :vk, index: true
      t.belongs_to :user, index: true
      t.datetime :groupsvks_date
      t.timestamps
	  end
  end
end
