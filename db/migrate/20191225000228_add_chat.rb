class AddChat < ActiveRecord::Migration[5.2]
  def change
  	create_table :chats do |t|
			t.string :text
			t.datetime :chat_date
	    t.timestamps
	    t.references :user, index: true, foreign_key: true
	    t.references :clan, index: true, foreign_key: true
	  end
  end
end
