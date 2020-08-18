class AddClansTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :clans do |t|
			t.string :clan, unique: true
    end
  end
end
