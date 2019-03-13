class AddMediaRowsField < ActiveRecord::Migration[5.2]
  def change
  	add_column :vks, :medias_row, :string
  end
end
