class AddOriginalFilenameInLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :original_filename, :string 
  end
end
