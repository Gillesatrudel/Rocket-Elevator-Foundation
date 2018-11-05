class ChangeAddressesFieldToBuilding < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :addresses_id
    remove_column :buildings, :administrator_full_name
    remove_column :buildings, :administrator_phone
    remove_column :buildings, :administrator_email
    remove_column :buildings, :technician_full_name
    remove_column :buildings, :technician_phone
    remove_column :buildings, :technician_email
    add_reference :buildings, :address, foreign_key: true
    add_column :buildings, :administrator_full_name, :string
    add_column :buildings, :administrator_phone, :string
    add_column :buildings, :administrator_email, :string
    add_column :buildings, :technician_full_name, :string
    add_column :buildings, :technician_phone, :string
    add_column :buildings, :technician_email, :string
  end
end
