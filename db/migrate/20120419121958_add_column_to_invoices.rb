class AddColumnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :grand_total, :string
  end
end
