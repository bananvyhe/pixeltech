class CreateGameboards < ActiveRecord::Migration[5.2]
  def change
    create_table :gameboards do |t|
      t.bigint :expirience
      t.integer :karma

      t.timestamps
    end
  end
end
