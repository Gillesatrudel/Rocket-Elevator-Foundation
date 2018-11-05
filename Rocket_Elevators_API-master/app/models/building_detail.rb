class BuildingDetail < ApplicationRecord
  belongs_to :building
  
  def name
    "#{self.information_key}: #{self.value}"
  end
 
end
