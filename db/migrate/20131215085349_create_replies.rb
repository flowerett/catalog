class CreateReplies < ActiveRecord::Migration
  def up
    create_table :replies do |t|
      t.references :product, :null => false
      t.string :name, :limit => 128, :null => false
      t.string :email, :limit => 255, :null => false
      t.text :content, :null => false

      t.timestamps
    end

    add_foreign_key(:replies, :products, dependent: :delete)

    add_index :replies, :product_id
    add_index :replies, :name
    add_index :replies, :email
  end

  def down
    drop_table :replies
  end
end
