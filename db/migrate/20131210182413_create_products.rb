class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.integer :price
      t.integer :inet_price
      t.string :image

      t.timestamps
    end
  end
end
