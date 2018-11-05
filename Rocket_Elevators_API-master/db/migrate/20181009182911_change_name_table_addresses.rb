class ChangeNameTableAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_table :addresses, :address
  end 
end
