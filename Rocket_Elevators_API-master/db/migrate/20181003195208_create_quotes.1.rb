class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer "nb_floors"
      t.string "type"

      t.timestamps
    end
  end
end
