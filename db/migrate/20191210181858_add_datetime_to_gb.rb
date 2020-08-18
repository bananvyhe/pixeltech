class AddDatetimeToGb < ActiveRecord::Migration[5.2]
  def change
  	add_column :gameboards, :starts_at_time_of_pk, :datetime
  end
end
