class AddReferenceToGameboard < ActiveRecord::Migration[5.2]
  def change
  	add_reference :gameboards, :user, foreign_key: true
  end
end
