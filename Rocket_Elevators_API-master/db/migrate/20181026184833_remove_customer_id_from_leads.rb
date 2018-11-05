class RemoveCustomerIdFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :customer_id
  end
end
