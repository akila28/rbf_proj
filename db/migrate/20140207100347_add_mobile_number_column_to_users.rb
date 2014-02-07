class AddMobileNumberColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Mobile_number, :integer
  end
end
