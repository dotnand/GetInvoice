class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :display_name
      t.string :eamil
      t.integer :phone
      t.text :address
      t.references :admin_user
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
