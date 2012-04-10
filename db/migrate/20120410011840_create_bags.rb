class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.integer :user_id
      t.boolean :approved
      t.string :color
      t.text :description
      t.string :brand
      t.integer :condition
      t.integer :size
      t.integer :price_paid
      t.integer :button_cost

      t.timestamps
    end
    add_index :bags, :user_id
  end
end
