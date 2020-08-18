class CreateVks < ActiveRecord::Migration[5.2]
  def change
    create_table :vks do |t|
      t.string :title
      t.string :posted_at
      t.integer :v_views
      t.integer :v_like
      t.string :thumb_map_img_as_div

      t.timestamps
    end
  end
end
