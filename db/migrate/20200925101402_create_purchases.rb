class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.integer :user
      t.integer :item
      t.timestamps
    end
  end
end
