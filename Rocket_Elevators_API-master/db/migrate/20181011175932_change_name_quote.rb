class ChangeNameQuote < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :quotes, :first_name, :full_name
    rename_column :quotes, :last_name, :business_name
  end
end
