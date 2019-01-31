class FiaeldsTableMistake < ActiveRecord::Migration[5.2]
  def change
  	  	remove_column :clients, :incoming
  		remove_column :clients, :spent

  		add_column :siteowners, :incoming, :float
  		add_column :siteowners, :spent, :float
  end
end
