class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.integer :category,         null: false
      t.integer :status,           null: false
      t.text :text,                null: false
      t.integer :price,            null: false
      t.references :user,          foreign_key: true, null: false
      t.integer :item_address,     null: false
      t.integer :days_to_ship,     null: false
      t.integer :shipping_charges, null: false
      t.timestamps
    end
  end
end
