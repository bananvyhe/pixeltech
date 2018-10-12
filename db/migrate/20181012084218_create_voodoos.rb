class CreateVoodoos < ActiveRecord::Migration[5.2]
  def change
    create_table :voodoos do |t|

      t.timestamps
    end
  end
end
