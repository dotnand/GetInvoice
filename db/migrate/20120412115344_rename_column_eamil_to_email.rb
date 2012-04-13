class RenameColumnEamilToEmail < ActiveRecord::Migration
  def up
    rename_column :accounts, :eamil, :email
  end

  def down
  end
end
