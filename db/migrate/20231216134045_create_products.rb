class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :description
      t.decimal :price, precision: 10, scale: 2, default: 0.0
      t.boolean :discounted, default: false
      t.integer :category, index: true
      t.datetime :archived_at # for soft delete

      t.timestamps
    end
  end
end
