class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.integer :account_id
      t.integer :invoice_id
      t.integer :admin_user_id
      t.text :contents

      t.timestamps
    end
  end
end
