class AddColumn1ToProduct < ActiveRecord::Migration
  def change
    add_column :products, :admin_user_id, :integer
  end
end
