class FieldsOnStr < ActiveRecord::Migration[5.2]
  def change
  	remove_column :vks, :v_views
  	remove_column :vks, :v_like

  	add_column :vks, :v_like, :string
  	add_column :vks, :v_views, :string
  end
end
