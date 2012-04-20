class CreatePaymentNotifications < ActiveRecord::Migration
  def self.up
    create_table :payment_notifications do |t|
      t.text :params
      t.integer :cart_id
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_notifications
  end
end
