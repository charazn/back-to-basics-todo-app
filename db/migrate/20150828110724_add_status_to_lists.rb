class AddStatusToLists < ActiveRecord::Migration
  def change
    add_column :lists, :status, :integer, :default => 1
  end
end
