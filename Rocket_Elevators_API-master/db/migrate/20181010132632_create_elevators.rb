class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :column, foreign_key: true
      t.integer :serial_number
      t.string :model
      t.string :building_type
      t.string :status
      t.date :in_service_since
      t.date :last_inspection
      t.string :inspection_certificate
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
