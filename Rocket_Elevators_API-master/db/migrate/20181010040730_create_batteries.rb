class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: true
      t.string :building_type
      t.string :status
      t.references :employee, foreign_key: true
      t.date :in_service_since
      t.date :last_inspection
      t.string :operations_certificate
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
