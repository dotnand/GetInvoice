class AddColumnToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :creator_id, :integer
  end
end
