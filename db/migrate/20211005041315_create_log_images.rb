class CreateLogImages < ActiveRecord::Migration[5.2]
  def change
    create_table :log_images do |t|
      t.integer :log_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
