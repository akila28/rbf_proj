class AddMobileNumberColumnToFolios < ActiveRecord::Migration
  def change
    add_column :folios, :mobile_number, :string
  end
end
