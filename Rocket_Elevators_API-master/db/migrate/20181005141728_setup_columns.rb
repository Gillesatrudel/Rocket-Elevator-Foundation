class SetupColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :quotetype
    remove_column :quotes, :first_name
    remove_column :quotes, :last_name
    remove_column :quotes, :email
    remove_column :quotes, :nb_floors
    remove_column :quotes, :nb_apt
    remove_column :quotes, :nb_base
    remove_column :quotes, :nb_cies
    remove_column :quotes, :nb_parking
    remove_column :quotes, :nb_shaft
    remove_column :quotes, :nb_corp
    remove_column :quotes, :nb_person
    remove_column :quotes, :bus_hours
    remove_column :quotes, :req_elev
    remove_column :quotes, :option
    remove_column :quotes, :nb_elev
    remove_column :quotes, :price_per_elev
    remove_column :quotes, :elev_total
    remove_column :quotes, :cost_install
    remove_column :quotes, :total
    add_column :quotes, :quote_type, :string
    add_column :quotes, :first_name, :string
    add_column :quotes, :last_name, :string
    add_column :quotes, :email, :string
    add_column :quotes, :nb_floors, :string
    add_column :quotes, :nb_apt, :integer
    add_column :quotes, :nb_base, :integer
    add_column :quotes, :nb_cies, :integer
    add_column :quotes, :nb_parking, :integer
    add_column :quotes, :nb_shaft, :integer
    add_column :quotes, :nb_corp, :integer
    add_column :quotes, :nb_person, :integer
    add_column :quotes, :bus_hours, :integer
    add_column :quotes, :req_elev, :integer
    add_column :quotes, :option, :string
    add_column :quotes, :nb_elev, :integer
    add_column :quotes, :price_per_elev, :float
    add_column :quotes, :elev_total, :float
    add_column :quotes, :cost_install, :float
    add_column :quotes, :total, :float
  end
end
