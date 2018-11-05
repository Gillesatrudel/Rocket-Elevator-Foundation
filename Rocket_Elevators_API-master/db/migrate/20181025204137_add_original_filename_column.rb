class AddOriginalFilenameColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :original_filename, :string 
  end
end
