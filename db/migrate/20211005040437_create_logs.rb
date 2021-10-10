class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :user_id, null: false
      t.text :coffee_name, null: false
      t.text :shop_name
      t.integer :price
      t.date :drink_date
      t.integer :brew, default: 0
      t.integer :roast, default: 0
      t.integer :taste, default: 0
      t.integer :body, default: 0
      t.text :memo
      t.float :rate

      t.timestamps
    end
  end
end
