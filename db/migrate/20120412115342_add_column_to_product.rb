class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :key, :string
  end
end
