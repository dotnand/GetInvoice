class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :account
      t.date :invoice_date
      t.string :status
      t.string :tax
      t.string :total
      t.string :discount
      t.string :shipping_cost

      t.timestamps
    end
  end
end
