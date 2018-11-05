class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :battery, foreign_key: true
      t.string :building_type
      t.integer :floors_served
      t.string :status
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
