class CreateVksUsersAssociation < ActiveRecord::Migration[5.2]
  def change
	    create_table :appointments do |t|
	      t.belongs_to :vk, index: true
	      t.belongs_to :user, index: true
	      t.datetime :appointment_date
	      t.timestamps
	  end
  end
end
