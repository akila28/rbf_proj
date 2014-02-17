class RemoveMobileNumberFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :Mobile_number
  end

  def down
    add_column :users, :Mobile_number, :integer
  end
end
