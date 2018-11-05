class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :customer, foreign_key: true
      t.references :addresses, foreign_key: true
      t.string :administrator_full_name
      t.string :administrator_phone
      t.string :administrator_email
      t.string :technician_full_name
      t.string :technician_phone
      t.string :technician_email

      t.timestamps
    end
  end
end
