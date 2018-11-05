class Battery < ApplicationRecord

  def building_type_enum
    [['Residential', 0],['Commercial',1],['Corporate',2],['Hybrid',3]]
  end
  def status_enum
        [['Active', 0],['Inactive',1],['Alarm',2]]
  end
  def name
    "##{self.id} (#{self.building.building_name})"
  end

  belongs_to :building
  belongs_to :Rocket_Elevator_Manager, :class_name => 'Employee', :foreign_key => 'employee_id'

  has_many :columns
  rails_admin do
    edit do
      exclude_fields :column
    end
  end
end
