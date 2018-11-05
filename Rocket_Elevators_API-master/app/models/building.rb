class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :batteries
  has_many :building_details

  rails_admin do
    edit do
      exclude_fields :batteries
    end
  end

  rails_admin do
    edit do
      exclude_fields :building_details
    end
  end
  def name
    "#{self.building_name}"
  end

end
