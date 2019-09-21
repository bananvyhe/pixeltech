class AddTableRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
			t.string :role, unique: true
    end

  end
end
