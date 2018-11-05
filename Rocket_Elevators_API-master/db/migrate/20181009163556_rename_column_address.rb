class RenameColumnAddress < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :addresses, :adrress_type, :address_type
  end
end
