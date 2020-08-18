class AddLinkpost < ActiveRecord::Migration[5.2]
  def change
  	add_column :vks, :wall, :string
  end
end
