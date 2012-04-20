class AddColumn2ToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :purchased_at, :date
	rename_column :payment_notifications, :cart_id, :invoice_id
  end
end
