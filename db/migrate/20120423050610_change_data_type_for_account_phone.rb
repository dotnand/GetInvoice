class ChangeDataTypeForAccountPhone < ActiveRecord::Migration
  def up
   change_table :accounts do |t|
      t.change :phone, :string
    end
  end

  def down
    change_table :accounts do |t|
      t.change :phone, :integer
    end
  end
end
