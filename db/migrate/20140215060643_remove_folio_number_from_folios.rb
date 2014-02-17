class RemoveFolioNumberFromFolios < ActiveRecord::Migration
  def up
    remove_column :folios, :folio_number
  end

  def down
    add_column :folios, :folio_number, :integer
  end
end
