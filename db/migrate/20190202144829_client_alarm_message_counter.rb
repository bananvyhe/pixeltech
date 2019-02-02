class ClientAlarmMessageCounter < ActiveRecord::Migration[5.2]
  def change
  	add_column :clients, :mescount, :integer
  end
end
