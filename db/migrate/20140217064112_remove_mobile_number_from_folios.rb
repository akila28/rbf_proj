class RemoveMobileNumberFromFolios < ActiveRecord::Migration
  def up
    remove_column :folios, :Mobile_number
  end

  def down
    add_column :folios, :Mobile_number, :integer
  end
end
