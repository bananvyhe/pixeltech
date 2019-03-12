class AddRating < ActiveRecord::Migration[5.2]
  def change
  	add_column :vks, :raiting, :float
  end
end
