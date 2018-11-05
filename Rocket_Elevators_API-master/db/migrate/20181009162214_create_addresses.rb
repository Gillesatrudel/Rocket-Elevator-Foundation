class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :adrress_type
      t.string :status
      t.string :entity
      t.string :street_address
      t.string :suite_or_apt
      t.string :city
      t.string :zip_code
      t.text :notes

      t.timestamps
    end
  end
end
