class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :button_amount
      t.timestamp :date
      t.string :type
      t.integer :bag_id
      t.text :feeback

      t.timestamps
    end
  end
end
