class AddUrlToVk < ActiveRecord::Migration[5.2]
  def change
  	add_column :vks, :url, :string
  end
end
