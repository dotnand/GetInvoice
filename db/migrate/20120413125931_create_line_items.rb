class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :invoice
      t.references :product
      t.integer :quantity
      t.string :total

      t.timestamps
    end
    add_index :line_items, :invoice_id
    add_index :line_items, :product_id
  end
end
