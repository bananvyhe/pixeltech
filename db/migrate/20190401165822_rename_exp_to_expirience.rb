class RenameExpToExpirience < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :exp, :expirience
  end
end
