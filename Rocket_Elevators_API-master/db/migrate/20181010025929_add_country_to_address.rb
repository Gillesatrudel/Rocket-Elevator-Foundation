class AddCountryToAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :notes
    add_column :addresses, :country, :string
    add_column :addresses, :notes, :text
  end
end
