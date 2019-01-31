class FiaeldsTableRevert < ActiveRecord::Migration[5.2]
  def change
  	  remove_column :siteowners, :incoming
  		remove_column :siteowners, :spent

  		add_column :clients, :incoming, :float
  		add_column :clients, :spent, :float
  end
end
