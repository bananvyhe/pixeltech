class AddPktable < ActiveRecord::Migration[5.2]
	def change
    create_table :kills do |t|
      t.belongs_to :gameboard
      t.datetime :starts_at_time_of_pk
      t.timestamps
    end
  end
end
