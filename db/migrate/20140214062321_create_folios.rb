class CreateFolios < ActiveRecord::Migration
  def change
    create_table :folios do |t|
      t.datetime :folio_allocation_date
      t.string :folio_number
      t.integer :no_of_shares
      t.integer :customer_id
      t.timestamps
    end
  end
end
