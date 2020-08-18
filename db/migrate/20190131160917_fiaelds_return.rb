class FiaeldsReturn < ActiveRecord::Migration[5.2]
  def change
  	add_column :siteowners, :incoming, :float
  	add_column :siteowners, :spent, :float
  	add_reference :siteowners, :user, foreign_key: true
  end
end
