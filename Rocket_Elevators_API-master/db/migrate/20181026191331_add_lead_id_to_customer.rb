class AddLeadIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :lead, foreign_key: true
  end
end
