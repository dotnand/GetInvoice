class AddColumnToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :unit_price, :string
  end
end
