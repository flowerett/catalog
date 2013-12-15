class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.integer :price
      t.integer :inet_price
      t.string :image

      t.timestamps
    end

    add_index :products, :title
    add_index :products, :price
    add_index :products, :inet_price
    add_index :products, :rating
  end

  def down
    drop_table :products
  end
end
